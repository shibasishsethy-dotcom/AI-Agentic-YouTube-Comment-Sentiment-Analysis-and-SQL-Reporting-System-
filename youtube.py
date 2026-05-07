














# # YouTube Comment Sentiment Analyzer — Streamlit App

# #
# # Architecture:
# #   - YouTube Data API  → fetch channel / videos / comments
# #   - HuggingFace       → distilbert sentiment model
# #   - MySQL / TiDB      → store all data (3 tables)
# #   - Streamlit         →  UI
# #


# import re
# import time
# import warnings

# import streamlit          as st
# import pandas             as pd
# import plotly.express     as px
# import plotly.graph_objects as go
# import mysql.connector

# from googleapiclient.discovery import build
# from transformers               import pipeline

# warnings.filterwarnings("ignore")


# # ── Page config ──────────────────────────────────────────────
# st.set_page_config(
#     page_title = "YouTube Sentiment Analyzer",
#     page_icon  = "🎬",
#     layout     = "wide",
# )


# # ── CSS ──────────────────────────────────────────────────────
# st.markdown("""
# <style>
#     @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=DM+Mono&display=swap');

#     html, body, [class*="css"] { font-family: 'DM Sans', sans-serif; }

#     .top-banner {
#         background: linear-gradient(135deg, #0f0f0f 0%, #1a1a2e 50%, #16213e 100%);
#         padding: 2.5rem 2rem 2rem;
#         border-radius: 16px;
#         margin-bottom: 2rem;
#         text-align: center;
#         border: 1px solid #ffffff15;
#     }
#     .top-banner h1 { color:#ffffff; font-size:2.4rem; font-weight:700; margin:0 0 .4rem; letter-spacing:-.5px; }
#     .top-banner p  { color:#ffffffaa; font-size:1.05rem; margin:0; }

#     .metric-card {
#         background:#ffffff; border:1px solid #e8e8e8; border-radius:12px;
#         padding:1.4rem 1.2rem; text-align:center;
#         box-shadow:0 2px 8px rgba(0,0,0,.06);
#     }
#     .metric-card .number { font-size:2.2rem; font-weight:700; color:#111; line-height:1; margin-bottom:.3rem; }
#     .metric-card .label  { font-size:.85rem; color:#888; text-transform:uppercase; letter-spacing:.06em; }

#     .verdict-good  { background:linear-gradient(90deg,#1a7f4b,#22a766); color:white; padding:1.2rem 1.5rem; border-radius:12px; font-size:1.1rem; font-weight:600; text-align:center; margin:1rem 0; }
#     .verdict-mixed { background:linear-gradient(90deg,#b45309,#d97706); color:white; padding:1.2rem 1.5rem; border-radius:12px; font-size:1.1rem; font-weight:600; text-align:center; margin:1rem 0; }
#     .verdict-poor  { background:linear-gradient(90deg,#991b1b,#dc2626); color:white; padding:1.2rem 1.5rem; border-radius:12px; font-size:1.1rem; font-weight:600; text-align:center; margin:1rem 0; }

#     .section-title { font-size:1.15rem; font-weight:700; color:#111; margin:1.8rem 0 1rem; padding-bottom:.5rem; border-bottom:2px solid #f0f0f0; }

#     .comment-card {
#         background:#fafafa; border:1px solid #ececec; border-left:4px solid #22a766;
#         border-radius:8px; padding:.9rem 1rem; margin-bottom:.6rem;
#         font-size:.92rem; line-height:1.55; color:#222;
#     }
#     .comment-card.negative { border-left-color:#dc2626; }
#     .comment-author { font-size:.78rem; color:#999; margin-top:.4rem; font-family:'DM Mono',monospace; }

#     .stButton > button {
#         background:linear-gradient(135deg,#ff0000,#cc0000); color:white; font-weight:700;
#         font-size:1rem; padding:.65rem 2rem; border:none; border-radius:8px; width:100%;
#         transition:transform .1s, box-shadow .1s;
#     }
#     .stButton > button:hover { transform:translateY(-1px); box-shadow:0 4px 12px rgba(255,0,0,.3); border:none; }

#     .stTextInput > div > div > input { border-radius:8px; border:2px solid #e0e0e0; padding:.55rem .9rem; font-size:1rem; }
#     div[data-testid="stExpander"] { border:1px solid #ececec; border-radius:10px; }
# </style>
# """, unsafe_allow_html=True)


# # ════════════════════════════════════════════════════════════
# # CACHED RESOURCES
# # ════════════════════════════════════════════════════════════

# @st.cache_resource
# def load_sentiment_model(hf_token: str):
#     """Download & cache the HuggingFace sentiment model. Runs once."""
#     return pipeline(
#         "sentiment-analysis",
#         model      = "distilbert-base-uncased-finetuned-sst-2-english",
#         token      = hf_token,
#         truncation = True,
#         max_length = 512,
#     )




# def get_db(db_config: dict):
#     return mysql.connector.connect(**db_config)


# def create_tables(db_config: dict):
#     """Create the three tables (drops and re-creates each run)."""
#     conn = get_db(db_config)
#     cur  = conn.cursor()

#     cur.execute("DROP TABLE IF EXISTS comments")
#     cur.execute("DROP TABLE IF EXISTS videos")
#     cur.execute("DROP TABLE IF EXISTS channels")

#     cur.execute("""
#         CREATE TABLE channels (
#             channel_id       VARCHAR(50)  PRIMARY KEY,
#             channel_title    VARCHAR(255),
#             description      TEXT,
#             subscriber_count BIGINT,
#             video_count      INT,
#             view_count       BIGINT,
#             thumbnail_url    VARCHAR(500),
#             created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
#         )
#     """)
#     cur.execute("""
#         CREATE TABLE videos (
#             video_id      VARCHAR(50)  PRIMARY KEY,
#             channel_id    VARCHAR(50),
#             title         VARCHAR(500),
#             description   TEXT,
#             published_at  DATETIME,
#             view_count    BIGINT,
#             like_count    BIGINT,
#             comment_count BIGINT,
#             FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
#         )
#     """)
#     cur.execute("""
#         CREATE TABLE comments (
#             comment_id      VARCHAR(100) PRIMARY KEY,
#             video_id        VARCHAR(50),
#             author_name     VARCHAR(255),
#             comment_text    TEXT,
#             like_count      INT,
#             published_at    DATETIME,
#             sentiment_label VARCHAR(20),
#             sentiment_score FLOAT,
#             FOREIGN KEY (video_id) REFERENCES videos(video_id)
#         )
#     """)
#     conn.commit(); cur.close(); conn.close()


# # ════════════════════════════════════════════════════════════
# # STEP 1 — Resolve channel & save to DB
# # ════════════════════════════════════════════════════════════

# def resolve_and_save_channel(youtube, db_config: dict, channel_input: str) -> dict | None:
#     """Find the YouTube channel, save to DB, return info dict."""

#     channel_id = None

#     if "youtube.com" in channel_input:
#         if "/@" in channel_input:
#             channel_input = "@" + channel_input.split("/@")[1].split("/")[0]
#         elif "/channel/" in channel_input:
#             channel_id = channel_input.split("/channel/")[1].split("/")[0]

#     if channel_id is None:
#         if channel_input.startswith("UC"):
#             channel_id = channel_input
#         else:
#             res = youtube.search().list(
#                 part="snippet", q=channel_input.replace("@", ""),
#                 type="channel", maxResults=1
#             ).execute()
#             if res.get("items"):
#                 channel_id = res["items"][0]["snippet"]["channelId"]

#     if not channel_id:
#         return None

#     ch_res = youtube.channels().list(
#         part="snippet,statistics,contentDetails", id=channel_id
#     ).execute()

#     if not ch_res.get("items"):
#         return None

#     ch    = ch_res["items"][0]
#     stats = ch.get("statistics", {})

#     info = {
#         "channel_id"         : channel_id,
#         "title"              : ch["snippet"]["title"],
#         "description"        : ch["snippet"].get("description", "")[:1000],
#         "subscriber_count"   : int(stats.get("subscriberCount", 0)),
#         "video_count"        : int(stats.get("videoCount", 0)),
#         "view_count"         : int(stats.get("viewCount", 0)),
#         "thumbnail_url"      : ch["snippet"]["thumbnails"]["default"]["url"],
#         "uploads_playlist_id": ch["contentDetails"]["relatedPlaylists"]["uploads"],
#     }

#     conn = get_db(db_config)
#     cur  = conn.cursor()
#     cur.execute("""
#         INSERT INTO channels
#             (channel_id, channel_title, description, subscriber_count,
#              video_count, view_count, thumbnail_url)
#         VALUES (%s,%s,%s,%s,%s,%s,%s)
#         ON DUPLICATE KEY UPDATE
#             channel_title=VALUES(channel_title),
#             subscriber_count=VALUES(subscriber_count),
#             view_count=VALUES(view_count)
#     """, (info["channel_id"], info["title"], info["description"],
#           info["subscriber_count"], info["video_count"], info["view_count"],
#           info["thumbnail_url"]))
#     conn.commit(); cur.close(); conn.close()

#     return info



# # STEP 2 — Fetch latest videos & save to DB


# def fetch_and_save_videos(youtube, db_config: dict,
#                           channel_id: str, uploads_playlist_id: str) -> list[dict]:
#     """Get 10 latest videos, save to DB, return list of video dicts."""

#     playlist_res = youtube.playlistItems().list(
#         part="snippet,contentDetails",
#         playlistId=uploads_playlist_id,
#         maxResults=10
#     ).execute()

#     videos = []
#     conn   = get_db(db_config)
#     cur    = conn.cursor()

#     for item in playlist_res.get("items", []):
#         vid_id  = item["contentDetails"]["videoId"]
#         details = youtube.videos().list(
#             part="snippet,statistics", id=vid_id
#         ).execute()

#         if not details.get("items"):
#             continue

#         v     = details["items"][0]
#         stats = v.get("statistics", {})
#         pub   = v["snippet"]["publishedAt"].replace("Z", "").replace("T", " ")[:19]

#         row = {
#             "video_id"     : vid_id,
#             "channel_id"   : channel_id,
#             "title"        : v["snippet"]["title"],
#             "description"  : v["snippet"].get("description", "")[:1000],
#             "published_at" : pub,
#             "view_count"   : int(stats.get("viewCount",    0)),
#             "like_count"   : int(stats.get("likeCount",    0)),
#             "comment_count": int(stats.get("commentCount", 0)),
#         }

#         cur.execute("""
#             INSERT INTO videos
#                 (video_id, channel_id, title, description,
#                  published_at, view_count, like_count, comment_count)
#             VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
#             ON DUPLICATE KEY UPDATE
#                 view_count=VALUES(view_count),
#                 like_count=VALUES(like_count)
#         """, (row["video_id"], row["channel_id"], row["title"], row["description"],
#               row["published_at"], row["view_count"], row["like_count"], row["comment_count"]))

#         videos.append(row)

#     conn.commit(); cur.close(); conn.close()
#     return videos



# # STEP 3 — Fetch comments, run sentiment, save to DB


# def fetch_analyze_save_comments(youtube, db_config: dict,
#                                 sentiment_model,
#                                 video_list: list[dict],
#                                 max_per_video: int = 50,
#                                 progress_callback=None) -> dict:
#     """
#     For each video: get comments → clean → run sentiment → save.
#     Returns totals dict.
#     """
#     conn = get_db(db_config)
#     cur  = conn.cursor()

#     total    = positive = negative = neutral = 0
#     n_videos = len(video_list)

#     for idx, video in enumerate(video_list):
#         vid_id    = video["video_id"]
#         vid_title = video["title"]

#         if progress_callback:
#             progress_callback(idx, n_videos, vid_title)

#         raw_comments = []
#         try:
#             res = youtube.commentThreads().list(
#                 part="snippet", videoId=vid_id,
#                 maxResults=min(max_per_video, 100),
#                 order="relevance", textFormat="plainText"
#             ).execute()

#             for item in res.get("items", []):
#                 c = item["snippet"]["topLevelComment"]["snippet"]
#                 raw_comments.append({
#                     "comment_id"  : item["id"],
#                     "author_name" : c.get("authorDisplayName", "Unknown"),
#                     "comment_text": c.get("textDisplay", ""),
#                     "like_count"  : int(c.get("likeCount", 0)),
#                     "published_at": c["publishedAt"].replace("Z","").replace("T"," ")[:19],
#                 })
#         except Exception:
#             pass   # comments disabled — skip silently

#         # --- Sentiment in batches of 32 ---
#         BATCH = 32
#         texts = []
#         for c in raw_comments:
#             clean = re.sub(r"[\x00-\x1f\x7f]", "", c["comment_text"]).strip()[:512]
#             texts.append(clean)

#         labels = []
#         scores = []
#         for start in range(0, len(texts), BATCH):
#             batch_texts = texts[start:start+BATCH]
#             try:
#                 results = sentiment_model(batch_texts)
#                 for r in results:
#                     labels.append(r["label"])
#                     scores.append(round(r["score"], 4))
#             except Exception:
#                 for _ in batch_texts:
#                     labels.append("NEUTRAL"); scores.append(0.5)

#         for i, c in enumerate(raw_comments):
#             lbl = labels[i] if i < len(labels) else "NEUTRAL"
#             scr = scores[i] if i < len(scores) else 0.5
#             cur.execute("""
#                 INSERT INTO comments
#                     (comment_id, video_id, author_name, comment_text,
#                      like_count, published_at, sentiment_label, sentiment_score)
#                 VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
#                 ON DUPLICATE KEY UPDATE
#                     sentiment_label=VALUES(sentiment_label),
#                     sentiment_score=VALUES(sentiment_score)
#             """, (c["comment_id"], vid_id, c["author_name"],
#                   c["comment_text"][:5000], c["like_count"],
#                   c["published_at"], lbl, scr))
#             total += 1
#             if   lbl == "POSITIVE": positive += 1
#             elif lbl == "NEGATIVE": negative += 1
#             else:                   neutral  += 1

#         conn.commit()
#         time.sleep(0.3)

#     cur.close(); conn.close()
#     return {"total": total, "positive": positive,
#             "negative": negative, "neutral": neutral}



# # STEP 4 — Build summary DataFrames from DB


# def generate_sentiment_report(db_config: dict, channel_id: str):
#     """Query DB and return (video_df, channel_df, comments_df)."""
#     conn = get_db(db_config)

#     video_df = pd.read_sql("""
#         SELECT
#             v.video_id, v.title, v.view_count, v.like_count,
#             COUNT(c.comment_id) AS total_comments,
#             SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END) AS positive_count,
#             SUM(CASE WHEN c.sentiment_label='NEGATIVE' THEN 1 ELSE 0 END) AS negative_count,
#             SUM(CASE WHEN c.sentiment_label='NEUTRAL'  THEN 1 ELSE 0 END) AS neutral_count,
#             ROUND(AVG(c.sentiment_score), 4) AS avg_score,
#             ROUND(
#                 SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END)*100.0
#                 / NULLIF(COUNT(c.comment_id),0),
#             2) AS positive_pct
#         FROM videos v
#         LEFT JOIN comments c ON v.video_id=c.video_id
#         WHERE v.channel_id=%s
#         GROUP BY v.video_id, v.title, v.view_count, v.like_count
#         ORDER BY v.published_at DESC
#     """, conn, params=(channel_id,))

#     channel_df = pd.read_sql("""
#         SELECT
#             ch.channel_title, ch.subscriber_count,
#             COUNT(DISTINCT v.video_id) AS videos_analyzed,
#             COUNT(c.comment_id)         AS total_comments,
#             SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END) AS positive_comments,
#             SUM(CASE WHEN c.sentiment_label='NEGATIVE' THEN 1 ELSE 0 END) AS negative_comments,
#             SUM(CASE WHEN c.sentiment_label='NEUTRAL'  THEN 1 ELSE 0 END) AS neutral_comments,
#             ROUND(AVG(c.sentiment_score),4) AS avg_score,
#             ROUND(
#                 SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END)*100.0
#                 / NULLIF(COUNT(c.comment_id),0),
#             2) AS positive_pct
#         FROM channels ch
#         LEFT JOIN videos   v  ON ch.channel_id=v.channel_id
#         LEFT JOIN comments c  ON v.video_id=c.video_id
#         WHERE ch.channel_id=%s
#         GROUP BY ch.channel_id, ch.channel_title, ch.subscriber_count
#     """, conn, params=(channel_id,))

#     comments_df = pd.read_sql("""
#         SELECT c.comment_id, v.title AS video_title,
#                c.author_name, c.comment_text, c.like_count,
#                c.sentiment_label, c.sentiment_score, c.published_at
#         FROM comments c
#         JOIN videos v ON c.video_id=v.video_id
#         WHERE v.channel_id=%s
#         ORDER BY c.published_at DESC
#     """, conn, params=(channel_id,))

#     conn.close()
#     return video_df, channel_df, comments_df


# # ════════════════════════════════════════════════════════════
# # UI — TOP BANNER
# # ════════════════════════════════════════════════════════════

# st.markdown("""
# <div class="top-banner">
#     <h1>🎬 YouTube Sentiment Analyzer</h1>
#     <p>Type any YouTube channel → AI collects comments → Sentiment model reads emotions → You see the results</p>
# </div>
# """, unsafe_allow_html=True)


# # ════════════════════════════════════════════════════════════
# # UI — SIDEBAR
# # ════════════════════════════════════════════════════════════

# with st.sidebar:
    

#     st.markdown("""
#     **YouTube API Key**
   
   
    
#     """)
#     api_key = st.text_input("YouTube API Key", type="password",
#                              placeholder="Paste YouTube API key")

#     st.markdown("---")
#     st.markdown("""
#     **HuggingFace Token**
    
#     """)
#     hf_token = st.text_input("HuggingFace Token", type="password",
#                               placeholder="hf_...")

#     st.markdown("---")
#     st.markdown("### 🗄️ MySQL / TiDB Database")

#     db_host = st.text_input("Host", placeholder="gateway01.ap-southeast-1...")
#     db_port = st.number_input("Port", value=4000, min_value=1, max_value=65535)
#     db_user = st.text_input("User", placeholder="your_user.root")
#     db_pass = st.text_input("Password", type="password")
#     db_name = st.text_input("Database name", placeholder="project")

#     st.markdown("---")
#     st.markdown("### 🎚️ Options")
#     max_comments = st.slider("Comments per video", 5, 100, 50, 5,
#                               help="More = more accurate, but slower")

#     st.markdown("---")
#     st.markdown("""
#     <div style='font-size:.8rem;color:#aaa;'>
#     <br>Streamlit · HuggingFace · YouTube API · MySQL
#     </div>""", unsafe_allow_html=True)


# # ════════════════════════════════════════════════════════════
# # UI — MAIN INPUT
# # ════════════════════════════════════════════════════════════

# col_input, col_btn = st.columns([4, 1])
# with col_input:
#     channel_input = st.text_input(
#         "channel", label_visibility="collapsed",
#         placeholder="e.g.  @MrBeast  or  https://youtube.com/@krishnaik06  or channel ID"
#     )
# with col_btn:
#     analyze_clicked = st.button("🔍 Analyze")

# if not channel_input and not analyze_clicked:
#     st.markdown("""
#     <div style='text-align:center;padding:3rem 0;color:#aaa;'>
#         <div style='font-size:3rem;'>👆</div>
#         <div style='font-size:1rem;margin-top:.5rem;'>
#             Enter a YouTube channel name above and click <strong>Analyze</strong>
#         </div>
#         <div style='font-size:.85rem;margin-top:.5rem;'>
#             You can type  @ChannelName  or paste a full YouTube URL
#         </div>
#     </div>""", unsafe_allow_html=True)





# if analyze_clicked:

#     # ── Validation ───────────────────────────────────────────
#     missing = []
#     if not api_key:   missing.append("YouTube API Key")
#     if not hf_token:  missing.append("HuggingFace Token")
#     if not db_host:   missing.append("DB Host")
#     if not db_user:   missing.append("DB User")
#     if not db_pass:   missing.append("DB Password")
#     if not db_name:   missing.append("DB Name")
#     if not channel_input: missing.append("Channel name")

#     if missing:
#         st.error(f"❌ Please fill in: {', '.join(missing)}")
#         st.stop()

#     DB_CONFIG = {
#         "host"    : db_host,
#         "port"    : int(db_port),
#         "user"    : db_user,
#         "password": db_pass,
#         "database": db_name,
#         "ssl_disabled": False,
#     }

#     # ── Load sentiment model ──────────────────────────────────
#     with st.spinner("Loading AI sentiment model (first time may take ~30 sec)..."):
#         try:
#             sentiment_model = load_sentiment_model(hf_token)
#         except Exception as e:
#             st.error(f"❌ Could not load AI model: {e}")
#             st.stop()

#     # ── Connect to YouTube ────────────────────────────────────
#     with st.spinner("Connecting to YouTube..."):
#         try:
#             youtube = build("youtube", "v3", developerKey=api_key)
#         except Exception as e:
#             st.error(f"❌ YouTube connection failed: {e}")
#             st.stop()

#     # ── Create DB tables ──────────────────────────────────────
#     with st.spinner("Setting up database tables..."):
#         try:
#             create_tables(DB_CONFIG)
#         except Exception as e:
#             st.error(f"❌ Database error: {e}")
#             st.stop()

#     # ── STEP 1 — Find channel ─────────────────────────────────
#     with st.spinner(f"Searching for channel: {channel_input}..."):
#         try:
#             channel_info = resolve_and_save_channel(youtube, DB_CONFIG, channel_input.strip())
#         except Exception as e:
#             st.error(f"❌ Error finding channel: {e}")
#             st.stop()

#     if not channel_info:
#         st.error("❌ Channel not found. Check the name and try again.")
#         st.stop()

#     # Channel card
#     ci1, ci2 = st.columns([1, 5])
#     with ci1:
#         st.image(channel_info["thumbnail_url"], width=80)
#     with ci2:
#         st.markdown(f"### {channel_info['title']}")
#         st.caption(
#             f"👥 {channel_info['subscriber_count']:,} subscribers  •  "
#             f"🎬 {channel_info['video_count']:,} videos  •  "
#             f"👁️ {channel_info['view_count']:,} total views"
#         )
#     st.markdown("---")

#     # ── STEP 2 — Fetch videos ─────────────────────────────────
#     with st.spinner("Fetching latest 10 videos..."):
#         try:
#             videos = fetch_and_save_videos(
#                 youtube, DB_CONFIG,
#                 channel_info["channel_id"],
#                 channel_info["uploads_playlist_id"]
#             )
#         except Exception as e:
#             st.error(f"❌ Error fetching videos: {e}")
#             st.stop()

#     if not videos:
#         st.error("❌ No videos found for this channel.")
#         st.stop()

#     st.success(f"✅ Found {len(videos)} videos!")

#     # ── STEP 3 — Comments + Sentiment ─────────────────────────
#     progress_bar  = st.progress(0, text="Collecting & analysing comments...")
#     status_text   = st.empty()

#     def on_progress(idx, total, title):
#         pct = (idx + 1) / total
#         progress_bar.progress(pct,
#             text=f"Video {idx+1}/{total}: {title[:50]}...")

#     try:
#         totals = fetch_analyze_save_comments(
#             youtube, DB_CONFIG, sentiment_model,
#             videos, max_per_video=max_comments,
#             progress_callback=on_progress
#         )
#     except Exception as e:
#         st.error(f"❌ Error during comment analysis: {e}")
#         st.stop()

#     progress_bar.empty()

#     if totals["total"] == 0:
#         st.warning("⚠️ No comments found — this channel may have comments disabled.")
#         st.stop()

#     st.success(f"✅ Analysed {totals['total']} comments!")

#     # ── STEP 4 — Build reports ────────────────────────────────
#     with st.spinner("Generating reports from database..."):
#         try:
#             video_df, channel_df, comments_df = generate_sentiment_report(
#                 DB_CONFIG, channel_info["channel_id"]
#             )
#         except Exception as e:
#             st.error(f"❌ Error generating report: {e}")
#             st.stop()

#     # ── Summary numbers ───────────────────────────────────────
#     row      = channel_df.iloc[0]
#     total    = int(row["total_comments"]    or 0)
#     positive = int(row["positive_comments"] or 0)
#     negative = int(row["negative_comments"] or 0)
#     neutral  = int(row["neutral_comments"]  or 0)
#     pos_pct  = float(row["positive_pct"]    or 0)

#     if   pos_pct >= 70: verdict = "Excellent — Audience loves this channel!"
#     elif pos_pct >= 50: verdict = "Good — Viewers generally enjoy this channel."
#     elif pos_pct >= 30: verdict = "Mixed — Some like it, some don't."
#     else:               verdict = "Poor — Most viewers are unhappy."

#     # ════════════════════════════════════════════════════════
#     # RESULTS
#     # ════════════════════════════════════════════════════════

#     st.markdown('<div class="section-title">📊 Results</div>', unsafe_allow_html=True)

#     # Metric cards
#     m1, m2, m3, m4, m5 = st.columns(5)
#     for col, num, color, label in [
#         (m1, len(videos),  "#111",     "Videos Analysed"),
#         (m2, total,        "#111",     "Comments Collected"),
#         (m3, positive,     "#1a7f4b",  "😊 Positive"),
#         (m4, negative,     "#dc2626",  "😔 Negative"),
#         (m5, neutral,      "#b45309",  "😐 Neutral"),
#     ]:
#         with col:
#             st.markdown(f"""
#             <div class="metric-card">
#                 <div class="number" style="color:{color};">{num:,}</div>
#                 <div class="label">{label}</div>
#             </div>""", unsafe_allow_html=True)

#     st.markdown("<br>", unsafe_allow_html=True)

#     # Verdict banner
#     css_class = ("verdict-good"  if pos_pct >= 60 else
#                  "verdict-mixed" if pos_pct >= 40 else
#                  "verdict-poor")
#     st.markdown(
#         f'<div class="{css_class}">📋 VERDICT: {verdict}</div>',
#         unsafe_allow_html=True
#     )

#     # ── Charts ────────────────────────────────────────────────
#     st.markdown('<div class="section-title">📈 Charts</div>', unsafe_allow_html=True)

#     ch1, ch2 = st.columns(2)

#     # Donut — overall sentiment
#     with ch1:
#         pie = px.pie(
#             values = [positive, negative, neutral],
#             names  = ["Positive 😊", "Negative 😔", "Neutral 😐"],
#             color  = ["Positive 😊", "Negative 😔", "Neutral 😐"],
#             color_discrete_map = {
#                 "Positive 😊": "#22a766",
#                 "Negative 😔": "#ef4444",
#                 "Neutral 😐" : "#f59e0b",
#             },
#             title = "Overall Sentiment Split"
#         )
#         pie.update_traces(textinfo="percent+label", hole=0.35)
#         pie.update_layout(showlegend=False, margin=dict(t=40,b=10,l=10,r=10), height=340)
#         st.plotly_chart(pie, use_container_width=True)

#     # Horizontal bar — per video
#     with ch2:
#         if len(video_df) > 0:
#             short = [t[:35]+"..." if len(t)>35 else t for t in video_df["title"]]
#             bar   = go.Figure()
#             bar.add_trace(go.Bar(name="Positive %", y=short,
#                                   x=video_df["positive_pct"].tolist(),
#                                   orientation="h", marker_color="#22a766"))
#             bar.add_trace(go.Bar(name="Negative %", y=short,
#                                   x=(100 - video_df["positive_pct"]).tolist(),
#                                   orientation="h", marker_color="#ef4444"))
#             bar.update_layout(title="Sentiment Per Video", barmode="group",
#                                xaxis_title="%", height=340,
#                                margin=dict(t=40,b=10,l=10,r=10),
#                                legend=dict(orientation="h", y=-0.15))
#             st.plotly_chart(bar, use_container_width=True)

#     st.markdown(
#         '<div class="section-title">🎬 Video-by-Video Breakdown</div>',
#         unsafe_allow_html=True
#     )

#     for _, row_v in video_df.iterrows():
#         pp   = float(row_v["positive_pct"] or 0)
#         mood = ("Very Positive"   if pp >= 70 else
#                 "Mostly Positive" if pp >= 50 else
#                 "Mixed"           if pp >= 30 else
#                 "Mostly Negative")
#         emoji = {"Very Positive":"🟢","Mostly Positive":"🟡",
#                  "Mixed":"🟠","Mostly Negative":"🔴"}.get(mood,"⚪")

#         with st.expander(f"{emoji} {str(row_v['title'])[:70]}"):
#             d1, d2, d3, d4, d5 = st.columns(5)
#             d1.metric("Comments",  int(row_v["total_comments"] or 0))
#             d2.metric("Positive",  f"{int(row_v['positive_count'] or 0)} ({pp:.1f}%)")
#             d3.metric("Negative",  f"{int(row_v['negative_count'] or 0)} ({100-pp:.1f}%)")
#             d4.metric("Neutral",   int(row_v["neutral_count"] or 0))
#             d5.metric("Mood",      mood)

#     # ── Sample comments ───────────────────────────────────────
#     st.markdown(
#         '<div class="section-title">💬 Sample Comments</div>',
#         unsafe_allow_html=True
#     )

#     tab_pos, tab_neg, tab_neu = st.tabs([
#         "😊 Top Positive", "😔 Top Negative", "😐 Neutral"
#     ])

#     def render_comments(df_slice, css_extra=""):
#         if len(df_slice) == 0:
#             st.info("No comments in this category.")
#             return
#         for _, c in df_slice.iterrows():
#             st.markdown(f"""
#             <div class="comment-card {css_extra}">
#                 {str(c['comment_text'])[:300]}
#                 <div class="comment-author">
#                     👤 {c['author_name']}  •  ❤️ {c['like_count']} likes  •  📅 {str(c['published_at'])[:10]}
#                 </div>
#             </div>""", unsafe_allow_html=True)

#     with tab_pos:
#         render_comments(
#             comments_df[comments_df["sentiment_label"]=="POSITIVE"]
#             .sort_values("like_count", ascending=False).head(8)
#         )
#     with tab_neg:
#         render_comments(
#             comments_df[comments_df["sentiment_label"]=="NEGATIVE"]
#             .sort_values("like_count", ascending=False).head(8),
#             css_extra="negative"
#         )
#     with tab_neu:
#         render_comments(
#             comments_df[comments_df["sentiment_label"]=="NEUTRAL"]
#             .sort_values("like_count", ascending=False).head(8)
#         )

#     # ── Download buttons ──────────────────────────────────────
#     st.markdown(
#         '<div class="section-title">⬇️ Download Reports</div>',
#         unsafe_allow_html=True
#     )


#     dl1, dl2, dl3 = st.columns(3)

#     comments_csv = comments_df.to_csv(index=False).encode("utf-8")
#     video_csv    = video_df.to_csv(index=False).encode("utf-8")
#     channel_csv  = channel_df.to_csv(index=False).encode("utf-8")

#     with dl1:
#         st.download_button("📄 All Comments CSV",  comments_csv,
#                            "all_comments_with_sentiment.csv", "text/csv")
#     with dl2:
#         st.download_button("📊 Video Report CSV",  video_csv,
#                            "video_sentiment_report.csv", "text/csv")
#     with dl3:
#         st.download_button("📋 Channel Summary CSV", channel_csv,
#                            "channel_summary_report.csv", "text/csv")





























# YouTube Comment Sentiment Analyzer — Streamlit App
#
# Architecture:
#   - YouTube Data API  → fetch channel / videos / comments
#   - HuggingFace       → distilbert sentiment model
#   - smolagents        → AI agent orchestration (Qwen2.5-72B brain)
#   - MySQL / TiDB      → store all data (3 tables)
#   - Streamlit         → UI
#

import re
import sys
import time
import warnings
import io
from datetime import date, datetime

import streamlit            as st
import pandas               as pd
import plotly.express       as px
import plotly.graph_objects as go
import mysql.connector

from googleapiclient.discovery import build
from transformers               import pipeline

warnings.filterwarnings("ignore")


try:
    from smolagents import tool as smolagents_tool, CodeAgent, InferenceClientModel
    SMOLAGENTS_OK = True
except ImportError:
    SMOLAGENTS_OK = False

# ════════════════════════════════════════════════════════════
# MODULE-LEVEL GLOBALS  (populated per-run so @tool closures work)
# ════════════════════════════════════════════════════════════
_g: dict = {"youtube": None, "sentiment": None, "db": None}


# ════════════════════════════════════════════════════════════
# SMOLAGENTS TOOL DEFINITIONS
#
# 

def _tool_resolve_and_save_channel(channel_input: str) -> str:
    """Find the YouTube channel using a handle, full URL, or channel ID.
    Save channel details to the database and return key IDs for the next step.

    Args:
        channel_input: Channel handle like @MrBeast, full YouTube URL, or channel ID.

    Returns:
        SUCCESS|channel_id|channel_title|uploads_playlist_id  or  ERROR|reason
    """
    youtube   = _g["youtube"]
    db_config = _g["db"]

    channel_id = None

    if "youtube.com" in channel_input:
        if "/@" in channel_input:
            channel_input = "@" + channel_input.split("/@")[1].split("/")[0]
        elif "/channel/" in channel_input:
            channel_id = channel_input.split("/channel/")[1].split("/")[0]

    if channel_id is None:
        if channel_input.startswith("UC"):
            channel_id = channel_input
        else:
            res = youtube.search().list(
                part="snippet", q=channel_input.replace("@", ""),
                type="channel", maxResults=1
            ).execute()
            if res.get("items"):
                channel_id = res["items"][0]["snippet"]["channelId"]

    if not channel_id:
        return "ERROR|Channel not found. Please check the name or link."

    ch_res = youtube.channels().list(
        part="snippet,statistics,contentDetails", id=channel_id
    ).execute()

    if not ch_res.get("items"):
        return "ERROR|Could not retrieve channel details from YouTube API."

    ch    = ch_res["items"][0]
    stats = ch.get("statistics", {})

    channel_name        = ch["snippet"]["title"]
    description         = ch["snippet"].get("description", "")[:1000]
    subscribers         = int(stats.get("subscriberCount", 0))
    total_videos        = int(stats.get("videoCount", 0))
    total_views         = int(stats.get("viewCount", 0))
    thumb               = ch["snippet"]["thumbnails"]["default"]["url"]
    uploads_playlist_id = ch["contentDetails"]["relatedPlaylists"]["uploads"]

    conn = mysql.connector.connect(**db_config)
    cur  = conn.cursor()
    cur.execute("""
        INSERT INTO channels
            (channel_id, channel_title, description, subscriber_count,
             video_count, view_count, thumbnail_url)
        VALUES (%s,%s,%s,%s,%s,%s,%s)
        ON DUPLICATE KEY UPDATE
            channel_title=VALUES(channel_title),
            subscriber_count=VALUES(subscriber_count),
            view_count=VALUES(view_count)
    """, (channel_id, channel_name, description,
          subscribers, total_videos, total_views, thumb))
    conn.commit(); cur.close(); conn.close()

    return f"SUCCESS|{channel_id}|{channel_name}|{uploads_playlist_id}"


def _tool_fetch_and_save_videos(channel_id: str, uploads_playlist_id: str) -> str:
    """Get the 10 most recent videos from the channel, save to database.

    Args:
        channel_id: The channel ID returned from the channel resolution step.
        uploads_playlist_id: The uploads playlist ID returned from the channel resolution step.

    Returns:
        SUCCESS|video_id1,video_id2,...|N videos saved  or  ERROR|reason
    """
    youtube   = _g["youtube"]
    db_config = _g["db"]

    playlist_res = youtube.playlistItems().list(
        part="snippet,contentDetails",
        playlistId=uploads_playlist_id,
        maxResults=10
    ).execute()

    video_ids = []
    conn      = mysql.connector.connect(**db_config)
    cur       = conn.cursor()

    for item in playlist_res.get("items", []):
        vid_id  = item["contentDetails"]["videoId"]
        details = youtube.videos().list(
            part="snippet,statistics", id=vid_id
        ).execute()
        if not details.get("items"):
            continue

        v     = details["items"][0]
        stats = v.get("statistics", {})
        pub   = v["snippet"]["publishedAt"].replace("Z", "").replace("T", " ")[:19]

        cur.execute("""
            INSERT INTO videos
                (video_id, channel_id, title, description,
                 published_at, view_count, like_count, comment_count)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
            ON DUPLICATE KEY UPDATE
                view_count=VALUES(view_count),
                like_count=VALUES(like_count)
        """, (vid_id, channel_id, v["snippet"]["title"],
              v["snippet"].get("description", "")[:1000], pub,
              int(stats.get("viewCount", 0)), int(stats.get("likeCount", 0)),
              int(stats.get("commentCount", 0))))
        video_ids.append(vid_id)

    conn.commit(); cur.close(); conn.close()

    if not video_ids:
        return "ERROR|No videos found for this channel."

    return f"SUCCESS|{','.join(video_ids)}|{len(video_ids)} videos saved"


def _tool_fetch_analyze_save_comments(video_ids_str: str) -> str:
    """Fetch comments for every video (with pagination up to 200 per video),
    run Hugging Face sentiment analysis on each, and save to the comments table.

    Args:
        video_ids_str: Comma-separated video IDs from the videos step. Example: abc123,def456

    Returns:
        SUCCESS|total|positive|negative|neutral  or  ERROR|reason
    """
    youtube         = _g["youtube"]
    sentiment_model = _g["sentiment"]
    db_config       = _g["db"]

    video_list = [v.strip() for v in video_ids_str.split(",") if v.strip()]

    conn  = mysql.connector.connect(**db_config)
    cur   = conn.cursor()
    total = positive = negative = neutral = 0

    for video_id in video_list:
        raw_comments = []
        try:
            res = youtube.commentThreads().list(
                part="snippet", videoId=video_id,
                maxResults=100, order="relevance", textFormat="plainText"
            ).execute()

            for item in res.get("items", []):
                c = item["snippet"]["topLevelComment"]["snippet"]
                raw_comments.append({
                    "comment_id"  : item["id"],
                    "author_name" : c.get("authorDisplayName", "Unknown"),
                    "comment_text": c.get("textDisplay", ""),
                    "like_count"  : int(c.get("likeCount", 0)),
                    "published_at": c["publishedAt"].replace("Z", "").replace("T", " ")[:19],
                })

            while "nextPageToken" in res and len(raw_comments) < 200:
                res = youtube.commentThreads().list(
                    part="snippet", videoId=video_id,
                    maxResults=100, order="relevance", textFormat="plainText",
                    pageToken=res["nextPageToken"]
                ).execute()
                for item in res.get("items", []):
                    c = item["snippet"]["topLevelComment"]["snippet"]
                    raw_comments.append({
                        "comment_id"  : item["id"],
                        "author_name" : c.get("authorDisplayName", "Unknown"),
                        "comment_text": c.get("textDisplay", ""),
                        "like_count"  : int(c.get("likeCount", 0)),
                        "published_at": c["publishedAt"].replace("Z", "").replace("T", " ")[:19],
                    })

        except Exception:
            continue

        BATCH  = 32
        texts  = [re.sub(r"[\x00-\x1f\x7f]", "", c["comment_text"]).strip()[:512]
                  for c in raw_comments]
        labels, scores = [], []

        for start in range(0, len(texts), BATCH):
            batch = texts[start:start + BATCH]
            try:
                results = sentiment_model(batch)
                for r in results:
                    labels.append(r["label"])
                    scores.append(round(r["score"], 4))
            except Exception:
                for _ in batch:
                    labels.append("NEUTRAL"); scores.append(0.5)

        for i, c in enumerate(raw_comments):
            lbl = labels[i] if i < len(labels) else "NEUTRAL"
            scr = scores[i] if i < len(scores) else 0.5
            cur.execute("""
                INSERT INTO comments
                    (comment_id, video_id, author_name, comment_text,
                     like_count, published_at, sentiment_label, sentiment_score)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
                ON DUPLICATE KEY UPDATE
                    sentiment_label=VALUES(sentiment_label),
                    sentiment_score=VALUES(sentiment_score)
            """, (c["comment_id"], video_id, c["author_name"],
                  c["comment_text"][:5000], c["like_count"],
                  c["published_at"], lbl, scr))
            total += 1
            if   lbl == "POSITIVE": positive += 1
            elif lbl == "NEGATIVE": negative += 1
            else:                   neutral  += 1

        conn.commit()
        time.sleep(0.3)

    cur.close(); conn.close()
    return f"SUCCESS|{total}|{positive}|{negative}|{neutral}"


def _tool_generate_sentiment_report(channel_id: str) -> str:
    """Query the database and generate a formatted text sentiment report for the channel.

    Args:
        channel_id: The channel ID from the channel resolution step.

    Returns:
        A formatted text report with sentiment breakdown and verdict.
    """
    db_config = _g["db"]
    conn      = mysql.connector.connect(**db_config)

    channel_df = pd.read_sql("""
        SELECT
            ch.channel_title, ch.subscriber_count,
            COUNT(DISTINCT v.video_id)  AS videos_analyzed,
            COUNT(c.comment_id)         AS total_comments,
            SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END) AS positive_comments,
            SUM(CASE WHEN c.sentiment_label='NEGATIVE' THEN 1 ELSE 0 END) AS negative_comments,
            SUM(CASE WHEN c.sentiment_label='NEUTRAL'  THEN 1 ELSE 0 END) AS neutral_comments,
            ROUND(AVG(c.sentiment_score), 4) AS avg_sentiment_score,
            ROUND(
                SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END)*100.0
                / NULLIF(COUNT(c.comment_id), 0),
            2) AS positive_pct
        FROM channels ch
        LEFT JOIN videos   v ON ch.channel_id=v.channel_id
        LEFT JOIN comments c ON v.video_id=c.video_id
        WHERE ch.channel_id=%s
        GROUP BY ch.channel_id, ch.channel_title, ch.subscriber_count
    """, conn, params=(channel_id,))
    conn.close()

    if channel_df.empty:
        return "ERROR|No data found. Ensure the earlier steps completed successfully."

    row     = channel_df.iloc[0]
    total   = int(row["total_comments"]    or 0)
    pos_c   = int(row["positive_comments"] or 0)
    neg_c   = int(row["negative_comments"] or 0)
    neu_c   = int(row["neutral_comments"]  or 0)
    pos_pct = round(pos_c * 100 / total, 2) if total > 0 else 0
    neg_pct = round(neg_c * 100 / total, 2) if total > 0 else 0
    neu_pct = round(neu_c * 100 / total, 2) if total > 0 else 0

    if   pos_pct >= 70: verdict = "VERY POSITIVE  — The audience absolutely loves this channel!"
    elif pos_pct >= 50: verdict = "MOSTLY POSITIVE  — Viewers generally enjoy this channel."
    elif pos_pct >= 30: verdict = "MIXED  — Some viewers like it, some do not."
    else:               verdict = "MOSTLY NEGATIVE  — Viewers are unhappy with this channel."

    return f"""
============================================================
         YOUTUBE CHANNEL SENTIMENT REPORT
============================================================

  Channel Name    : {row['channel_title']}
  Subscribers     : {int(row['subscriber_count']):,}
  Videos Checked  : {int(row['videos_analyzed'])}
  Total Comments  : {total}

  ---- Sentiment Breakdown ----
  Positive  : {pos_c:>5} comments  ({pos_pct}%)
  Negative  : {neg_c:>5} comments  ({neg_pct}%)
  Neutral   : {neu_c:>5} comments  ({neu_pct}%)

  Avg Confidence  : {row['avg_sentiment_score']}
  Verdict         : {verdict}

============================================================
"""



if SMOLAGENTS_OK:
    agent_resolve_and_save_channel    = smolagents_tool(_tool_resolve_and_save_channel)
    agent_fetch_and_save_videos       = smolagents_tool(_tool_fetch_and_save_videos)
    agent_fetch_analyze_save_comments = smolagents_tool(_tool_fetch_analyze_save_comments)
    agent_generate_sentiment_report   = smolagents_tool(_tool_generate_sentiment_report)



# SQL DUMP HELPER


def _sql_value(value) -> str:
    if value is None:
        return "NULL"
    if isinstance(value, (datetime, date)):
        return f"'{value}'"
    if isinstance(value, str):
        value = value.replace("\\", "\\\\").replace("'", "''")
        return f"'{value}'"
    return str(value)


def build_sql_dump(db_config: dict) -> str:
    """Generate a full SQL dump of all 3 tables as a text string."""
    conn   = mysql.connector.connect(**db_config)
    cur    = conn.cursor()
    tables = ["channels", "videos", "comments"]
    lines  = ["-- YouTube Sentiment Analysis SQL Dump", "-- Generated by Streamlit App", ""]

    for table in tables:
        lines.append(f"-- TABLE: {table}")
        lines.append(f"DROP TABLE IF EXISTS {table};")

        cur.execute(f"SHOW CREATE TABLE {table}")
        create_sql = cur.fetchone()[1]
        lines.append(create_sql + ";")
        lines.append("")

        cur.execute(f"SELECT * FROM {table}")
        columns = [col[0] for col in cur.description]

        for row in cur.fetchall():
            cols = ", ".join(columns)
            vals = ", ".join(_sql_value(v) for v in row)
            lines.append(f"INSERT INTO {table} ({cols}) VALUES ({vals});")

        lines.append("")

    cur.close(); conn.close()
    return "\n".join(lines)



# PAGE CONFIG


st.set_page_config(
    page_title = "YouTube Sentiment Analyzer",
    page_icon  = "🎬",
    layout     = "wide",
)

# ── CSS ──────────────────────────────────────────────────────
st.markdown("""
<style>
    @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=DM+Mono&display=swap');

    html, body, [class*="css"] { font-family: 'DM Sans', sans-serif; }

    .top-banner {
        background: linear-gradient(135deg, #0f0f0f 0%, #1a1a2e 50%, #16213e 100%);
        padding: 2.5rem 2rem 2rem;
        border-radius: 16px;
        margin-bottom: 2rem;
        text-align: center;
        border: 1px solid #ffffff15;
    }
    .top-banner h1 { color:#ffffff; font-size:2.4rem; font-weight:700; margin:0 0 .4rem; letter-spacing:-.5px; }
    .top-banner p  { color:#ffffffaa; font-size:1.05rem; margin:0; }

    .metric-card {
        background:#ffffff; border:1px solid #e8e8e8; border-radius:12px;
        padding:1.4rem 1.2rem; text-align:center;
        box-shadow:0 2px 8px rgba(0,0,0,.06);
    }
    .metric-card .number { font-size:2.2rem; font-weight:700; color:#111; line-height:1; margin-bottom:.3rem; }
    .metric-card .label  { font-size:.85rem; color:#888; text-transform:uppercase; letter-spacing:.06em; }

    .verdict-good  { background:linear-gradient(90deg,#1a7f4b,#22a766); color:white; padding:1.2rem 1.5rem; border-radius:12px; font-size:1.1rem; font-weight:600; text-align:center; margin:1rem 0; }
    .verdict-mixed { background:linear-gradient(90deg,#b45309,#d97706); color:white; padding:1.2rem 1.5rem; border-radius:12px; font-size:1.1rem; font-weight:600; text-align:center; margin:1rem 0; }
    .verdict-poor  { background:linear-gradient(90deg,#991b1b,#dc2626); color:white; padding:1.2rem 1.5rem; border-radius:12px; font-size:1.1rem; font-weight:600; text-align:center; margin:1rem 0; }

    .section-title { font-size:1.15rem; font-weight:700; color:#111; margin:1.8rem 0 1rem; padding-bottom:.5rem; border-bottom:2px solid #f0f0f0; }

    .comment-card {
        background:#fafafa; border:1px solid #ececec; border-left:4px solid #22a766;
        border-radius:8px; padding:.9rem 1rem; margin-bottom:.6rem;
        font-size:.92rem; line-height:1.55; color:#222;
    }
    .comment-card.negative { border-left-color:#dc2626; }
    .comment-author { font-size:.78rem; color:#999; margin-top:.4rem; font-family:'DM Mono',monospace; }

    .agent-log {
        background:#0f0f0f; border:1px solid #333; border-radius:10px;
        padding:1rem 1.2rem; font-family:'DM Mono',monospace;
        font-size:.8rem; color:#a3e635; line-height:1.7;
        max-height:320px; overflow-y:auto;
    }
    .agent-badge {
        display:inline-block; background:linear-gradient(135deg,#5b21b6,#7c3aed);
        color:white; font-size:.78rem; font-weight:700; padding:.2rem .7rem;
        border-radius:20px; margin-bottom:.5rem; letter-spacing:.04em;
    }

    .stButton > button {
        background:linear-gradient(135deg,#ff0000,#cc0000); color:white; font-weight:700;
        font-size:1rem; padding:.65rem 2rem; border:none; border-radius:8px; width:100%;
        transition:transform .1s, box-shadow .1s;
    }
    .stButton > button:hover { transform:translateY(-1px); box-shadow:0 4px 12px rgba(255,0,0,.3); border:none; }

    .stTextInput > div > div > input { border-radius:8px; border:2px solid #e0e0e0; padding:.55rem .9rem; font-size:1rem; }
    div[data-testid="stExpander"] { border:1px solid #ececec; border-radius:10px; }
</style>
""", unsafe_allow_html=True)




@st.cache_resource
def load_sentiment_model(hf_token: str):
    return pipeline(
        "sentiment-analysis",
        model      = "distilbert-base-uncased-finetuned-sst-2-english",
        token      = hf_token,
        truncation = True,
        max_length = 512,
    )


def get_db(db_config: dict):
    return mysql.connector.connect(**db_config)


def create_tables(db_config: dict):
    conn = get_db(db_config)
    cur  = conn.cursor()
    cur.execute("DROP TABLE IF EXISTS comments")
    cur.execute("DROP TABLE IF EXISTS videos")
    cur.execute("DROP TABLE IF EXISTS channels")
    cur.execute("""
        CREATE TABLE channels (
            channel_id       VARCHAR(50)  PRIMARY KEY,
            channel_title    VARCHAR(255),
            description      TEXT,
            subscriber_count BIGINT,
            video_count      INT,
            view_count       BIGINT,
            thumbnail_url    VARCHAR(500),
            created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    """)
    cur.execute("""
        CREATE TABLE videos (
            video_id      VARCHAR(50)  PRIMARY KEY,
            channel_id    VARCHAR(50),
            title         VARCHAR(500),
            description   TEXT,
            published_at  DATETIME,
            view_count    BIGINT,
            like_count    BIGINT,
            comment_count BIGINT,
            FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
        )
    """)
    cur.execute("""
        CREATE TABLE comments (
            comment_id      VARCHAR(100) PRIMARY KEY,
            video_id        VARCHAR(50),
            author_name     VARCHAR(255),
            comment_text    TEXT,
            like_count      INT,
            published_at    DATETIME,
            sentiment_label VARCHAR(20),
            sentiment_score FLOAT,
            FOREIGN KEY (video_id) REFERENCES videos(video_id)
        )
    """)
    conn.commit(); cur.close(); conn.close()




def resolve_and_save_channel(youtube, db_config: dict, channel_input: str) -> dict | None:
    channel_id = None
    if "youtube.com" in channel_input:
        if "/@" in channel_input:
            channel_input = "@" + channel_input.split("/@")[1].split("/")[0]
        elif "/channel/" in channel_input:
            channel_id = channel_input.split("/channel/")[1].split("/")[0]
    if channel_id is None:
        if channel_input.startswith("UC"):
            channel_id = channel_input
        else:
            res = youtube.search().list(
                part="snippet", q=channel_input.replace("@",""),
                type="channel", maxResults=1
            ).execute()
            if res.get("items"):
                channel_id = res["items"][0]["snippet"]["channelId"]
    if not channel_id:
        return None
    ch_res = youtube.channels().list(
        part="snippet,statistics,contentDetails", id=channel_id
    ).execute()
    if not ch_res.get("items"):
        return None
    ch    = ch_res["items"][0]
    stats = ch.get("statistics", {})
    info  = {
        "channel_id"         : channel_id,
        "title"              : ch["snippet"]["title"],
        "description"        : ch["snippet"].get("description","")[:1000],
        "subscriber_count"   : int(stats.get("subscriberCount",0)),
        "video_count"        : int(stats.get("videoCount",0)),
        "view_count"         : int(stats.get("viewCount",0)),
        "thumbnail_url"      : ch["snippet"]["thumbnails"]["default"]["url"],
        "uploads_playlist_id": ch["contentDetails"]["relatedPlaylists"]["uploads"],
    }
    conn = get_db(db_config)
    cur  = conn.cursor()
    cur.execute("""
        INSERT INTO channels
            (channel_id, channel_title, description, subscriber_count,
             video_count, view_count, thumbnail_url)
        VALUES (%s,%s,%s,%s,%s,%s,%s)
        ON DUPLICATE KEY UPDATE
            channel_title=VALUES(channel_title),
            subscriber_count=VALUES(subscriber_count),
            view_count=VALUES(view_count)
    """, (info["channel_id"], info["title"], info["description"],
          info["subscriber_count"], info["video_count"], info["view_count"],
          info["thumbnail_url"]))
    conn.commit(); cur.close(); conn.close()
    return info


def fetch_and_save_videos(youtube, db_config: dict,
                          channel_id: str, uploads_playlist_id: str) -> list[dict]:
    playlist_res = youtube.playlistItems().list(
        part="snippet,contentDetails",
        playlistId=uploads_playlist_id, maxResults=10
    ).execute()
    videos = []
    conn   = get_db(db_config)
    cur    = conn.cursor()
    for item in playlist_res.get("items", []):
        vid_id  = item["contentDetails"]["videoId"]
        details = youtube.videos().list(part="snippet,statistics", id=vid_id).execute()
        if not details.get("items"):
            continue
        v     = details["items"][0]
        stats = v.get("statistics", {})
        pub   = v["snippet"]["publishedAt"].replace("Z","").replace("T"," ")[:19]
        row   = {
            "video_id"     : vid_id,
            "channel_id"   : channel_id,
            "title"        : v["snippet"]["title"],
            "description"  : v["snippet"].get("description","")[:1000],
            "published_at" : pub,
            "view_count"   : int(stats.get("viewCount",0)),
            "like_count"   : int(stats.get("likeCount",0)),
            "comment_count": int(stats.get("commentCount",0)),
        }
        cur.execute("""
            INSERT INTO videos
                (video_id, channel_id, title, description,
                 published_at, view_count, like_count, comment_count)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
            ON DUPLICATE KEY UPDATE
                view_count=VALUES(view_count), like_count=VALUES(like_count)
        """, (row["video_id"], row["channel_id"], row["title"], row["description"],
              row["published_at"], row["view_count"], row["like_count"], row["comment_count"]))
        videos.append(row)
    conn.commit(); cur.close(); conn.close()
    return videos


def fetch_analyze_save_comments(youtube, db_config: dict,
                                sentiment_model,
                                video_list: list[dict],
                                max_per_video: int = 200,
                                progress_callback=None) -> dict:
    """Fetch comments with pagination (up to max_per_video), run sentiment, save."""
    conn     = get_db(db_config)
    cur      = conn.cursor()
    total    = positive = negative = neutral = 0
    n_videos = len(video_list)

    for idx, video in enumerate(video_list):
        vid_id    = video["video_id"]
        vid_title = video["title"]
        if progress_callback:
            progress_callback(idx, n_videos, vid_title)

        raw_comments = []
        try:
            # First page
            res = youtube.commentThreads().list(
                part="snippet", videoId=vid_id,
                maxResults=min(max_per_video, 100),
                order="relevance", textFormat="plainText"
            ).execute()
            for item in res.get("items", []):
                c = item["snippet"]["topLevelComment"]["snippet"]
                raw_comments.append({
                    "comment_id"  : item["id"],
                    "author_name" : c.get("authorDisplayName","Unknown"),
                    "comment_text": c.get("textDisplay",""),
                    "like_count"  : int(c.get("likeCount",0)),
                    "published_at": c["publishedAt"].replace("Z","").replace("T"," ")[:19],
                })
            # Pagination — keep fetching until we hit max_per_video
            while "nextPageToken" in res and len(raw_comments) < max_per_video:
                res = youtube.commentThreads().list(
                    part="snippet", videoId=vid_id,
                    maxResults=min(max_per_video - len(raw_comments), 100),
                    order="relevance", textFormat="plainText",
                    pageToken=res["nextPageToken"]
                ).execute()
                for item in res.get("items", []):
                    c = item["snippet"]["topLevelComment"]["snippet"]
                    raw_comments.append({
                        "comment_id"  : item["id"],
                        "author_name" : c.get("authorDisplayName","Unknown"),
                        "comment_text": c.get("textDisplay",""),
                        "like_count"  : int(c.get("likeCount",0)),
                        "published_at": c["publishedAt"].replace("Z","").replace("T"," ")[:19],
                    })
        except Exception:
            pass

        BATCH  = 32
        texts  = [re.sub(r"[\x00-\x1f\x7f]","",c["comment_text"]).strip()[:512]
                  for c in raw_comments]
        labels, scores = [], []
        for start in range(0, len(texts), BATCH):
            batch_texts = texts[start:start+BATCH]
            try:
                results = sentiment_model(batch_texts)
                for r in results:
                    labels.append(r["label"]); scores.append(round(r["score"],4))
            except Exception:
                for _ in batch_texts:
                    labels.append("NEUTRAL"); scores.append(0.5)

        for i, c in enumerate(raw_comments):
            lbl = labels[i] if i < len(labels) else "NEUTRAL"
            scr = scores[i] if i < len(scores) else 0.5
            cur.execute("""
                INSERT INTO comments
                    (comment_id, video_id, author_name, comment_text,
                     like_count, published_at, sentiment_label, sentiment_score)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
                ON DUPLICATE KEY UPDATE
                    sentiment_label=VALUES(sentiment_label),
                    sentiment_score=VALUES(sentiment_score)
            """, (c["comment_id"], vid_id, c["author_name"],
                  c["comment_text"][:5000], c["like_count"],
                  c["published_at"], lbl, scr))
            total += 1
            if   lbl == "POSITIVE": positive += 1
            elif lbl == "NEGATIVE": negative += 1
            else:                   neutral  += 1

        conn.commit()
        time.sleep(0.3)

    cur.close(); conn.close()
    return {"total":total,"positive":positive,"negative":negative,"neutral":neutral}


def generate_sentiment_report(db_config: dict, channel_id: str):
    conn = get_db(db_config)
    video_df = pd.read_sql("""
        SELECT
            v.video_id, v.title, v.view_count, v.like_count,
            COUNT(c.comment_id) AS total_comments,
            SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END) AS positive_count,
            SUM(CASE WHEN c.sentiment_label='NEGATIVE' THEN 1 ELSE 0 END) AS negative_count,
            SUM(CASE WHEN c.sentiment_label='NEUTRAL'  THEN 1 ELSE 0 END) AS neutral_count,
            ROUND(AVG(c.sentiment_score),4) AS avg_score,
            ROUND(
                SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END)*100.0
                / NULLIF(COUNT(c.comment_id),0),
            2) AS positive_pct
        FROM videos v
        LEFT JOIN comments c ON v.video_id=c.video_id
        WHERE v.channel_id=%s
        GROUP BY v.video_id, v.title, v.view_count, v.like_count
        ORDER BY v.published_at DESC
    """, conn, params=(channel_id,))

    channel_df = pd.read_sql("""
        SELECT
            ch.channel_title, ch.subscriber_count,
            COUNT(DISTINCT v.video_id) AS videos_analyzed,
            COUNT(c.comment_id)        AS total_comments,
            SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END) AS positive_comments,
            SUM(CASE WHEN c.sentiment_label='NEGATIVE' THEN 1 ELSE 0 END) AS negative_comments,
            SUM(CASE WHEN c.sentiment_label='NEUTRAL'  THEN 1 ELSE 0 END) AS neutral_comments,
            ROUND(AVG(c.sentiment_score),4) AS avg_score,
            ROUND(
                SUM(CASE WHEN c.sentiment_label='POSITIVE' THEN 1 ELSE 0 END)*100.0
                / NULLIF(COUNT(c.comment_id),0),
            2) AS positive_pct
        FROM channels ch
        LEFT JOIN videos   v ON ch.channel_id=v.channel_id
        LEFT JOIN comments c ON v.video_id=c.video_id
        WHERE ch.channel_id=%s
        GROUP BY ch.channel_id, ch.channel_title, ch.subscriber_count
    """, conn, params=(channel_id,))

    comments_df = pd.read_sql("""
        SELECT c.comment_id, v.title AS video_title,
               c.author_name, c.comment_text, c.like_count,
               c.sentiment_label, c.sentiment_score, c.published_at
        FROM comments c
        JOIN videos v ON c.video_id=v.video_id
        WHERE v.channel_id=%s
        ORDER BY c.published_at DESC
    """, conn, params=(channel_id,))

    conn.close()
    return video_df, channel_df, comments_df




st.markdown("""
<div class="top-banner">
    <h1>🎬 YouTube Sentiment Analyzer</h1>
    <p>Type any YouTube channel → AI agent collects comments → Sentiment model reads emotions → You see the results</p>
</div>
""", unsafe_allow_html=True)


# ════════════════════════════════════════════════════════════
# UI — SIDEBAR
# ════════════════════════════════════════════════════════════

with st.sidebar:
    st.markdown("**YouTube API Key**")
    api_key = st.text_input("YouTube API Key", type="password",
                             placeholder="Paste YouTube API key")

    st.markdown("---")
    st.markdown("**HuggingFace Token**")
    hf_token = st.text_input("HuggingFace Token", type="password",
                              placeholder="hf_...")

    st.markdown("---")
    st.markdown("### 🗄️ MySQL / TiDB Database")
    db_host = st.text_input("Host", placeholder="gateway01.ap-southeast-1...")
    db_port = st.number_input("Port", value=4000, min_value=1, max_value=65535)
    db_user = st.text_input("User", placeholder="your_user.root")
    db_pass = st.text_input("Password", type="password")
    db_name = st.text_input("Database name", placeholder="project")

    st.markdown("---")
    st.markdown("### 🎚️ Options")
    max_comments = st.slider("Comments per video", 5, 200, 100, 5,
                              help="Up to 200 via pagination — more = more accurate, but slower")

    # ── Agent Mode ────────────────────────────────────────────
    st.markdown("---")
    st.markdown("### 🤖 Agent Mode")

    if SMOLAGENTS_OK:
        agent_mode = st.toggle("Enable smolagents Orchestration", value=False,
                               help="Uses Qwen/Qwen2.5-72B as the agent brain to orchestrate the 4-step pipeline")
        if agent_mode:
            agent_model_id = st.text_input(
                "Agent Model ID",
                value="Qwen/Qwen2.5-72B-Instruct",
                help="Any HuggingFace InferenceClient-compatible model"
            )
        else:
            agent_model_id = ""
    else:
        st.caption("⚠️ `smolagents` not installed. Run `pip install smolagents` to enable Agent Mode.")
        agent_mode     = False
        agent_model_id = ""

    st.markdown("---")
    st.markdown("""<div style='font-size:.8rem;color:#aaa;'>
    Streamlit · HuggingFace · smolagents · YouTube API · MySQL
    </div>""", unsafe_allow_html=True)




col_input, col_btn = st.columns([4, 1])
with col_input:
    channel_input = st.text_input(
        "channel", label_visibility="collapsed",
        placeholder="e.g.  @MrBeast  or  https://youtube.com/@krishnaik06  or channel ID"
    )
with col_btn:
    analyze_clicked = st.button("🔍 Analyze")

if not channel_input and not analyze_clicked:
    st.markdown("""
    <div style='text-align:center;padding:3rem 0;color:#aaa;'>
        <div style='font-size:3rem;'>👆</div>
        <div style='font-size:1rem;margin-top:.5rem;'>
            Enter a YouTube channel name above and click <strong>Analyze</strong>
        </div>
        <div style='font-size:.85rem;margin-top:.5rem;'>
            You can type  @ChannelName  or paste a full YouTube URL
        </div>
    </div>""", unsafe_allow_html=True)



# ANALYSIS FLOW


if analyze_clicked:

    # ── Validation ───────────────────────────────────────────
    missing = []
    if not api_key:       missing.append("YouTube API Key")
    if not hf_token:      missing.append("HuggingFace Token")
    if not db_host:       missing.append("DB Host")
    if not db_user:       missing.append("DB User")
    if not db_pass:       missing.append("DB Password")
    if not db_name:       missing.append("DB Name")
    if not channel_input: missing.append("Channel name")
    if agent_mode and not agent_model_id:
        missing.append("Agent Model ID")

    if missing:
        st.error(f"❌ Please fill in: {', '.join(missing)}")
        st.stop()

    DB_CONFIG = {
        "host"        : db_host,
        "port"        : int(db_port),
        "user"        : db_user,
        "password"    : db_pass,
        "database"    : db_name,
        "ssl_disabled": False,
    }

    # ── Load sentiment model ──────────────────────────────────
    with st.spinner("Loading AI sentiment model (first time may take ~30 sec)..."):
        try:
            sentiment_model = load_sentiment_model(hf_token)
        except Exception as e:
            st.error(f"❌ Could not load AI model: {e}")
            st.stop()

    # ── Connect to YouTube ────────────────────────────────────
    with st.spinner("Connecting to YouTube..."):
        try:
            youtube = build("youtube", "v3", developerKey=api_key)
        except Exception as e:
            st.error(f"❌ YouTube connection failed: {e}")
            st.stop()

    # ── Create DB tables ──────────────────────────────────────
    with st.spinner("Setting up database tables..."):
        try:
            create_tables(DB_CONFIG)
        except Exception as e:
            st.error(f"❌ Database error: {e}")
            st.stop()

    # AGENT MODE  — smolagents orchestration
    
    if agent_mode and SMOLAGENTS_OK:

        # Populate module-level globals so @tool functions can access them
        _g["youtube"]   = youtube
        _g["sentiment"] = sentiment_model
        _g["db"]        = DB_CONFIG

        st.markdown("""
        <div style="margin-bottom:.8rem;">
            <span class="agent-badge">🤖 AGENT MODE — smolagents + Qwen2.5-72B</span>
        </div>
        """, unsafe_allow_html=True)

        agent_log_placeholder = st.empty()
        agent_log_lines: list[str] = []

        def update_agent_log(line: str):
            agent_log_lines.append(line)
            log_html = "<br>".join(agent_log_lines[-40:])  # show last 40 lines
            agent_log_placeholder.markdown(
                f'<div class="agent-log">{log_html}</div>', unsafe_allow_html=True
            )

        update_agent_log("🔧 Initialising InferenceClientModel...")

        try:
            agent_brain = InferenceClientModel(
                model_id=agent_model_id, token=hf_token
            )
            agent = CodeAgent(
                tools=[
                    agent_resolve_and_save_channel,
                    agent_fetch_and_save_videos,
                    agent_fetch_analyze_save_comments,
                    agent_generate_sentiment_report,
                ],
                model       = agent_brain,
                max_steps   = 12,
                verbosity_level=1,
            )
            update_agent_log(f"✅ Agent ready — model: {agent_model_id}")
        except Exception as e:
            st.error(f"❌ Could not initialise agent: {e}")
            st.stop()

        task = f"""
You are a YouTube sentiment analysis agent.
Analyze the YouTube channel: '{channel_input.strip()}'

Follow these steps in exact order:

Step 1 — Call agent_resolve_and_save_channel(channel_input='{channel_input.strip()}')
         Result format: SUCCESS|channel_id|title|uploads_playlist_id
         Parse to get channel_id and uploads_playlist_id.

Step 2 — Call agent_fetch_and_save_videos(channel_id=<from step 1>, uploads_playlist_id=<from step 1>)
         Result format: SUCCESS|video_id1,video_id2,...|N videos saved
         Parse to get the comma-separated video_ids string.

Step 3 — Call agent_fetch_analyze_save_comments(video_ids_str=<video_ids from step 2>)
         This fetches comments with pagination, runs sentiment analysis, and saves everything.

Step 4 — Call agent_generate_sentiment_report(channel_id=<from step 1>)
         This returns the final formatted text report.

Return the final report text from Step 4.
"""
        update_agent_log("🚀 Starting agent run...")

        # Capture stdout from the agent's verbosity output
        captured_stdout = io.StringIO()
        original_stdout = sys.stdout
        sys.stdout = captured_stdout

        agent_final_report = None
        try:
            agent_final_report = agent.run(task)
        except Exception as e:
            sys.stdout = original_stdout
            st.error(f"❌ Agent error: {e}")
            st.stop()
        finally:
            sys.stdout = original_stdout

        # Show captured agent logs
        for line in captured_stdout.getvalue().splitlines():
            if line.strip():
                update_agent_log(line)

        update_agent_log("✅ Agent finished!")

        # Show agent's text report in an expander
        if agent_final_report:
            with st.expander("📋 Agent Final Report (text)", expanded=False):
                st.code(str(agent_final_report), language="")

        # Resolve channel_info for the channel card below
        # (re-fetch from DB since agent already saved it)
        try:
            _conn = get_db(DB_CONFIG)
            _cur  = _conn.cursor(dictionary=True)
            _cur.execute("SELECT * FROM channels LIMIT 1")
            _row = _cur.fetchone()
            _cur.close(); _conn.close()
            channel_info = {
                "channel_id"         : _row["channel_id"],
                "title"              : _row["channel_title"],
                "subscriber_count"   : _row["subscriber_count"],
                "video_count"        : _row["video_count"],
                "view_count"         : _row["view_count"],
                "thumbnail_url"      : _row.get("thumbnail_url",""),
                "uploads_playlist_id": "",
            }
        except Exception as e:
            st.error(f"❌ Could not fetch channel data after agent run: {e}")
            st.stop()

   
    # DIRECT MODE  — original sequential pipeline
   
    else:

        # STEP 1 — Find channel
        with st.spinner(f"Searching for channel: {channel_input}..."):
            try:
                channel_info = resolve_and_save_channel(youtube, DB_CONFIG, channel_input.strip())
            except Exception as e:
                st.error(f"❌ Error finding channel: {e}")
                st.stop()

        if not channel_info:
            st.error("❌ Channel not found. Check the name and try again.")
            st.stop()

        # STEP 2 — Fetch videos
        with st.spinner("Fetching latest 10 videos..."):
            try:
                videos = fetch_and_save_videos(
                    youtube, DB_CONFIG,
                    channel_info["channel_id"],
                    channel_info["uploads_playlist_id"]
                )
            except Exception as e:
                st.error(f"❌ Error fetching videos: {e}")
                st.stop()

        if not videos:
            st.error("❌ No videos found for this channel.")
            st.stop()

        st.success(f"✅ Found {len(videos)} videos!")

        # STEP 3 — Comments + Sentiment
        progress_bar = st.progress(0, text="Collecting & analysing comments...")

        def on_progress(idx, total, title):
            pct = (idx + 1) / total
            progress_bar.progress(pct, text=f"Video {idx+1}/{total}: {title[:50]}...")

        try:
            totals = fetch_analyze_save_comments(
                youtube, DB_CONFIG, sentiment_model,
                videos, max_per_video=max_comments,
                progress_callback=on_progress
            )
        except Exception as e:
            st.error(f"❌ Error during comment analysis: {e}")
            st.stop()

        progress_bar.empty()

        if totals["total"] == 0:
            st.warning("⚠️ No comments found — this channel may have comments disabled.")
            st.stop()

        st.success(f"✅ Analysed {totals['total']} comments!")

    # ─
    ci1, ci2 = st.columns([1, 5])
    with ci1:
        if channel_info.get("thumbnail_url"):
            st.image(channel_info["thumbnail_url"], width=80)
    with ci2:
        st.markdown(f"### {channel_info['title']}")
        st.caption(
            f"👥 {channel_info['subscriber_count']:,} subscribers  •  "
            f"🎬 {channel_info['video_count']:,} videos  •  "
            f"👁️ {channel_info['view_count']:,} total views"
        )
    st.markdown("---")

    # ── STEP 4 — Build reports ────────────────────────────────
    with st.spinner("Generating reports from database..."):
        try:
            video_df, channel_df, comments_df = generate_sentiment_report(
                DB_CONFIG, channel_info["channel_id"]
            )
        except Exception as e:
            st.error(f"❌ Error generating report: {e}")
            st.stop()

    # ── Summary numbers ───────────────────────────────────────
    row      = channel_df.iloc[0]
    total    = int(row["total_comments"]    or 0)
    positive = int(row["positive_comments"] or 0)
    negative = int(row["negative_comments"] or 0)
    neutral  = int(row["neutral_comments"]  or 0)
    pos_pct  = float(row["positive_pct"]    or 0)

    if   pos_pct >= 70: verdict = "Excellent — Audience loves this channel!"
    elif pos_pct >= 50: verdict = "Good — Viewers generally enjoy this channel."
    elif pos_pct >= 30: verdict = "Mixed — Some like it, some don't."
    else:               verdict = "Poor — Most viewers are unhappy."

  
    # RESULTS
   

    st.markdown('<div class="section-title">📊 Results</div>', unsafe_allow_html=True)

    # Metric cards
    m1, m2, m3, m4, m5 = st.columns(5)
    for col, num, color, label in [
        (m1, len(video_df),  "#111",     "Videos Analysed"),
        (m2, total,          "#111",     "Comments Collected"),
        (m3, positive,       "#1a7f4b",  "😊 Positive"),
        (m4, negative,       "#dc2626",  "😔 Negative"),
        (m5, neutral,        "#b45309",  "😐 Neutral"),
    ]:
        with col:
            st.markdown(f"""
            <div class="metric-card">
                <div class="number" style="color:{color};">{num:,}</div>
                <div class="label">{label}</div>
            </div>""", unsafe_allow_html=True)

    st.markdown("<br>", unsafe_allow_html=True)

    # Verdict banner
    css_class = ("verdict-good"  if pos_pct >= 60 else
                 "verdict-mixed" if pos_pct >= 40 else
                 "verdict-poor")
    st.markdown(
        f'<div class="{css_class}">📋 VERDICT: {verdict}</div>',
        unsafe_allow_html=True
    )

    # ── Charts ────────────────────────────────────────────────
    st.markdown('<div class="section-title">📈 Charts</div>', unsafe_allow_html=True)

    ch1, ch2 = st.columns(2)

    with ch1:
        pie = px.pie(
            values=[positive, negative, neutral],
            names=["Positive 😊","Negative 😔","Neutral 😐"],
            color=["Positive 😊","Negative 😔","Neutral 😐"],
            color_discrete_map={
                "Positive 😊":"#22a766",
                "Negative 😔":"#ef4444",
                "Neutral 😐" :"#f59e0b",
            },
            title="Overall Sentiment Split"
        )
        pie.update_traces(textinfo="percent+label", hole=0.35)
        pie.update_layout(showlegend=False, margin=dict(t=40,b=10,l=10,r=10), height=340)
        st.plotly_chart(pie, use_container_width=True)

    with ch2:
        if len(video_df) > 0:
            short = [t[:35]+"..." if len(t)>35 else t for t in video_df["title"]]
            bar   = go.Figure()
            bar.add_trace(go.Bar(name="Positive %", y=short,
                                  x=video_df["positive_pct"].tolist(),
                                  orientation="h", marker_color="#22a766"))
            bar.add_trace(go.Bar(name="Negative %", y=short,
                                  x=(100-video_df["positive_pct"]).tolist(),
                                  orientation="h", marker_color="#ef4444"))
            bar.update_layout(title="Sentiment Per Video", barmode="group",
                               xaxis_title="%", height=340,
                               margin=dict(t=40,b=10,l=10,r=10),
                               legend=dict(orientation="h",y=-0.15))
            st.plotly_chart(bar, use_container_width=True)

    st.markdown(
        '<div class="section-title">🎬 Video-by-Video Breakdown</div>',
        unsafe_allow_html=True
    )

    for _, row_v in video_df.iterrows():
        pp    = float(row_v["positive_pct"] or 0)
        mood  = ("Very Positive"   if pp >= 70 else
                 "Mostly Positive" if pp >= 50 else
                 "Mixed"           if pp >= 30 else
                 "Mostly Negative")
        emoji = {"Very Positive":"🟢","Mostly Positive":"🟡",
                 "Mixed":"🟠","Mostly Negative":"🔴"}.get(mood,"⚪")

        with st.expander(f"{emoji} {str(row_v['title'])[:70]}"):
            d1,d2,d3,d4,d5 = st.columns(5)
            d1.metric("Comments", int(row_v["total_comments"] or 0))
            d2.metric("Positive", f"{int(row_v['positive_count'] or 0)} ({pp:.1f}%)")
            d3.metric("Negative", f"{int(row_v['negative_count'] or 0)} ({100-pp:.1f}%)")
            d4.metric("Neutral",  int(row_v["neutral_count"] or 0))
            d5.metric("Mood",     mood)

    # ── Sample comments ───────────────────────────────────────
    st.markdown(
        '<div class="section-title">💬 Sample Comments</div>',
        unsafe_allow_html=True
    )

    tab_pos, tab_neg, tab_neu = st.tabs(["😊 Top Positive","😔 Top Negative","😐 Neutral"])

    def render_comments(df_slice, css_extra=""):
        if len(df_slice) == 0:
            st.info("No comments in this category.")
            return
        for _, c in df_slice.iterrows():
            st.markdown(f"""
            <div class="comment-card {css_extra}">
                {str(c['comment_text'])[:300]}
                <div class="comment-author">
                    👤 {c['author_name']}  •  ❤️ {c['like_count']} likes  •  📅 {str(c['published_at'])[:10]}
                </div>
            </div>""", unsafe_allow_html=True)

    with tab_pos:
        render_comments(
            comments_df[comments_df["sentiment_label"]=="POSITIVE"]
            .sort_values("like_count",ascending=False).head(8)
        )
    with tab_neg:
        render_comments(
            comments_df[comments_df["sentiment_label"]=="NEGATIVE"]
            .sort_values("like_count",ascending=False).head(8),
            css_extra="negative"
        )
    with tab_neu:
        render_comments(
            comments_df[comments_df["sentiment_label"]=="NEUTRAL"]
            .sort_values("like_count",ascending=False).head(8)
        )

    # ── Download buttons ──────────────────────────────────────
    st.markdown(
        '<div class="section-title">⬇️ Download Reports</div>',
        unsafe_allow_html=True
    )

    dl1, dl2, dl3, dl4 = st.columns(4)

    comments_csv = comments_df.to_csv(index=False).encode("utf-8")
    video_csv    = video_df.to_csv(index=False).encode("utf-8")
    channel_csv  = channel_df.to_csv(index=False).encode("utf-8")

    with dl1:
        st.download_button("📄 All Comments CSV", comments_csv,
                           "all_comments_with_sentiment.csv", "text/csv")
    with dl2:
        st.download_button("📊 Video Report CSV", video_csv,
                           "video_sentiment_report.csv", "text/csv")
    with dl3:
        st.download_button("📋 Channel Summary CSV", channel_csv,
                           "channel_summary_report.csv", "text/csv")
    with dl4:
        # SQL Dump — generated on the fly (from notebook Cell 9)
        with st.spinner("Building SQL dump..."):
            try:
                sql_dump = build_sql_dump(DB_CONFIG).encode("utf-8")
                st.download_button("🗄️ SQL Dump", sql_dump,
                                   "sentiment_analysis_dump.sql", "text/plain")
            except Exception as e:
                st.error(f"SQL dump failed: {e}")







