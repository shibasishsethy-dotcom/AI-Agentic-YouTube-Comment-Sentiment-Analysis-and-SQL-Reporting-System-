# AI-Agentic-YouTube-Comment-Sentiment-Analysis-and-SQL-Reporting-System-




The project accepts a YouTube channel as input, fetches the latest videos and comments using the official YouTube Data API, analyzes comment sentiment with a Hugging Face model, stores the data in SQL, and exports CSV reports.

Main Files
YouTube Agentic Sentiment Analysis.ipynb

youtube.py - main Python code

TECHNICAL_DOCUMENT.md - project explanation

Output Files Created After Running
youtube_sentiment.db - Tidb database
youtube_sentiment_dump.sql - SQL dump
video_sentiment_report.csv - video wise sentiment report
channel_summary_report.csv - channel level summary report
all_comments_with_sentiment.csv - all comments with sentiment labels
How To Run In Google Colab
Upload and open YouTube_Agentic_Sentiment_Analysis_Complete.ipynb.

Run each cell from top to bottom.



YouTube Data API key
Hugging Face token
Enter a YouTube channel input, for example:

@MrBeast
https://www.youtube.com/@MrBeast
UCX6OQ3DkcsbYNE6H8uQQuVA
MrBeast






Agent mode: uses Hugging Face smolagents. This matches the project title best.

The four tools are:

resolve_and_save_channel
fetch_and_save_videos
fetch_analyze_save_comments
generate_sentiment_report
