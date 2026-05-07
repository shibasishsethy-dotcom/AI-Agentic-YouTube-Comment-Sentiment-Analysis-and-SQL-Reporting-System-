-- YouTube Sentiment Analysis SQL Dump

-- TABLE: channels
DROP TABLE IF EXISTS channels;
CREATE TABLE `channels` (
  `channel_id` varchar(50) NOT NULL,
  `channel_title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `subscriber_count` bigint DEFAULT NULL,
  `video_count` int DEFAULT NULL,
  `view_count` bigint DEFAULT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`channel_id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
INSERT INTO channels (channel_id, channel_title, description, subscriber_count, video_count, view_count, created_at) VALUES ('UCrC8mOqJQpoB7NuIMKIS6rQ', 'StudyIQ IAS', '📚 StudyIQ Education - India''s #1 Online Learning Platform for Government Exams

StudyIQ Education Pvt Ltd is India’s most trusted online platform for UPSC Civil Services Exam preparation. With a legacy of guiding thousands of successful aspirants, we offer expert-led video lectures, bilingual content (English & Hindi), and fully structured courses for all three stages—Prelims, Mains, and Interview. Covering the entire UPSC syllabus—GS, CSAT, Current Affairs, Essay, and Optional Subjects—StudyIQ ensures deep conceptual clarity, smart strategies, and consistent mentorship to help you succeed in your IAS journey.

✨ What Makes Us Different:
- Live Classes
- Expert faculty with proven track record
- Coverage of all major government exams
- Bilingual content (Hindi & English)
- Accessible from any district across India
- Smart learning methodology
- Time-efficient exam preparation

🏆 Join thousands of successful candidates who trusted StudyIQ for their exam preparation!



', 20400000, 64500, 8162399041, '2026-05-06 20:40:11');
INSERT INTO channels (channel_id, channel_title, description, subscriber_count, video_count, view_count, created_at) VALUES ('UCx-7YPrGnNC81ahyqvqu27g', 'Careerwill SSC', 'Welcome to Careerwill – India''s Most Trusted Platform for SSC Exam Preparation under the expert guidance of RAKESH YADAV SIR!

Careerwill SSC YouTube channel provides high-quality learning content to help students prepare for SSC exams like SSC CGL,SSC CPO, SSC CHSL, SSC MTS and GD Constable.  

➡️ With the trust of lakhs of aspirants across India, Careerwill helps students prepare effectively through structured courses and experienced educators.

For Complete SSC Coaching 🏆 Join SSC PRATHAM BATCH – Our Flagship SSC Preparation Program

✅ All Subjects Covered: Maths | English | Reasoning | GK & GS
✅ Concept-First Approach for Long-Term Retention
✅ Regular Practice Sessions & Mock Tests
✅ Experienced & Result-Proven Faculty
✅ Study at Your Own Pace – Live + Recorded Options

🔔 Subscribe Now & Hit the Bell Icon to never miss a class!
📲 Download the Careerwill App for full access to courses, tests, and live classes.
☎️ Help & Support: +91 9311775205
', 1680000, 4670, 251419352, '2026-05-06 20:44:15');

-- TABLE: videos
DROP TABLE IF EXISTS videos;
CREATE TABLE `videos` (
  `video_id` varchar(50) NOT NULL,
  `channel_id` varchar(50) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `view_count` bigint DEFAULT NULL,
  `like_count` bigint DEFAULT NULL,
  `comment_count` bigint DEFAULT NULL,
  PRIMARY KEY (`video_id`) /*T![clustered_index] CLUSTERED */,
  KEY `fk_1` (`channel_id`),
  CONSTRAINT `fk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('0qMTrMRRihY', 'UCx-7YPrGnNC81ahyqvqu27g', 'Daily Current Affairs 2026 | 7 May Current Affairs 2026 | Current Affairs Today | Jayshree Ma''am', 'Daily Current Affairs 2026 | 7 May Current Affairs 2026 | Current Affairs Today | Jayshree Ma''am

🎙Join Jayshree Ma''am Spotify Channel - https://open.spotify.com/episode/5TyM4VFX1X4LoX0MyfQWYF

PDF - https://drive.google.com/file/d/1viCtQZ3RarEuFI2Nv7Ep6n1d3MMpClIc/view?usp=sharing
📕SSC Pratham Foundation Batch 2026 :- https://careerwillapp.page.link/SLe3jVCn1oibxZs2A
📕 English Spl Batch By Ankul Sir - https://careerwillapp.page.link/8FjWdRZ3V27BaEZB8
📕UPSSSC LOWER PCS 2026 - https://careerwillapp.page.link/UhqV3Z5bHY4oJUFU7
📕 Maths Spl Batch By Rakesh Sir - https://careerwillapp.page.link/DvXNAFkVDnapYRzE7
📕UPP Constable (Sarthi Batch) -  https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
🔴𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 6.0 (New Batch 𝟐𝟎𝟐𝟔) 𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/LFF4SF9tEpi2ceaC6
📕 DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
📕UPSSSC 2026 Excise Constable : https://careerwillapp.page.link/21yZ', '2026-05-06 10:49:23', 0, 10, 0);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('21JPw29GxxQ', 'UCx-7YPrGnNC81ahyqvqu27g', 'Ankul Sir की Nouns Complete Guidance | English Tricks | SSC | SSC CGL | English #shorts #english', 'Ankul Sir कि Nouns Complete Guidance | English Tricks | SSC | SSC CGL | English #shorts #english
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
📕SSC प्रथम 18 New Batch 2026 :-  https://careerwillapp.page.link/SLe3jVCn1oibxZs2A
📕Maths Special (B-63 Recorded Batch 2026) Rakesh SIR:  https://careerwillapp.page.link/VZadpi4dV8Zdi8RUA
📕Maths Spl. (Recorded) B-62 (ADUTIYA SIR):  https://careerwillapp.page.link/V3GdoKSUpVkJH1bT9
📕DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
📕𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 5.0 New Batch 𝟐𝟎𝟐𝟔 (𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/QcamEcnQ7Xvnp9AdA
📕UPP Constable (Paper Out Batch) - https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
📕 Delhi High Court (JJA) VOD Batch - https://careerwillapp.page.link/gTicVWjoBzfXTz9f6
📕 Railway Science Special - https://careerwillapp.page.link/hbrKbG4RAejowKus7


✅ Maths by Rakesh Yadav Sir, Abhinay Sir
✅ English by Jaideep Sir,Gopal Sir
✅ Reasoning by Piyush Sir,Arun Sir
', '2026-05-05 12:21:19', 3151, 92, 8);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('2T6c77uuqbk', 'UCx-7YPrGnNC81ahyqvqu27g', 'Daily Current Affairs 2026 | 6 May Current Affairs 2026 | Current Affairs Today | Jayshree Ma''am', 'Daily Current Affairs 2026 | 6 May Current Affairs 2026 | Current Affairs Today | Jayshree Ma''am

🎙Join Jayshree Ma''am Spotify Channel - https://open.spotify.com/episode/5TyM4VFX1X4LoX0MyfQWYF

PDF - https://drive.google.com/file/d/1viCtQZ3RarEuFI2Nv7Ep6n1d3MMpClIc/view?usp=sharing
📕SSC Pratham Foundation Batch 2026 :- https://careerwillapp.page.link/SLe3jVCn1oibxZs2A
📕 English Spl Batch By Ankul Sir - https://careerwillapp.page.link/8FjWdRZ3V27BaEZB8
📕UPSSSC LOWER PCS 2026 - https://careerwillapp.page.link/UhqV3Z5bHY4oJUFU7
📕 Maths Spl Batch By Rakesh Sir - https://careerwillapp.page.link/DvXNAFkVDnapYRzE7
📕UPP Constable (Sarthi Batch) -  https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
🔴𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 6.0 (New Batch 𝟐𝟎𝟐𝟔) 𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/LFF4SF9tEpi2ceaC6
📕 DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
📕UPSSSC 2026 Excise Constable : https://careerwillapp.page.link/21yZ', '2026-05-06 03:26:52', 13263, 1157, 51);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('A8v_BlhgKgg', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'India’s Own Starlink? | Reliance Plans Massive LEO Satellite Internet | UPSC | StudyIQ IAS', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/ARGLIVE

Call Us for UPSC Counselling-  9240231046 / 76-4000-3000

To download the PDF: https://studyiq.u9ilnk.me/d/GENp0BzUnJ

Use code ''VASULIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ARGLIVE

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/Qu7HG2Hv3E

Download our App for Dedicated UPSC Materials & Support - https://studyiq.u9ilnk.me/d/RQtp71j77l

India’s Own Starlink? | Reliance Plans Massive LEO Satellite Internet | UPSC | StudyIQ IAS

Reliance Jio is ready to launch India’s own LEO satellite internet to challenge Elon Musk''s Starlink. In this deep-dive, Ankit Agrawal from StudyIQ IAS explains Mukesh Ambani’s multi-billion dollar plan for Low Earth Orb', '2026-05-06 16:56:40', 5646, 186, 12);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('AbeTMM-WlT8', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'Mystery Behind "The One-Vote Defeat" in 1999 | Most Shocking Day of Indian Politics | Varun Jauhari', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/VarunJauhari

YouTube Series By Varun Jauhari : https://studyiq.u9ilnk.me/d/bc1Ms433aQ

Call Us for UPSC Counselling-  76-4000-3000

Use code ''VJLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/VarunJauhari

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/rBcOdKv3eE

Download our App for Dedicated UPSC Materials & Support - https://studyiq.u9ilnk.me/d/RQtp71j77l

Mystery Behind "The One-Vote Defeat" in 1999 | Most Shocking Day of Indian Politics | Varun Jauhari

How could a single vote bring down a Prime Minister? We dive into the most shocking day in Indian political history: the 1999 defeat of the Atal Bihari Vajpayee government.

In this video, Varun Jauhari ', '2026-05-06 17:00:06', 2887, 126, 5);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('Q8Vjzh_pQfo', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'The Hindu Analysis | 7th May 2026 | The Hindu News Paper Today With Practice Questions | StudyIQ', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/ARGLIVE

Call Us for UPSC Counselling-  9240231046 / 76-4000-3000

To download the PDF: https://studyiq.u9ilnk.me/d/GENp0BzUnJ

Use code ''VASULIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ARGLIVE

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/Qu7HG2Hv3E

Download our App for Dedicated UPSC Materials & Support - https://studyiq.u9ilnk.me/d/RQtp71j77l

The Hindu Analysis | 7th May 2026 | The Hindu News Paper Today With Practice Questions | StudyIQ

Stay updated with the latest current affairs from The Hindu newspaper dated 7th May 2026 This video covers important headlines, editorial insights, and exam-oriented practice questions – perfect for UPSC, SSC, Bank', '2026-05-06 15:17:34', 0, 0, 0);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('QFMIcAB_QLI', 'UCx-7YPrGnNC81ahyqvqu27g', 'Daily Current Affairs 2026 | 5 May Current Affairs 2026 | Current Affairs Today | Jayshree Ma''am', 'Daily Current Affairs 2026 | 5 May Current Affairs 2026 | Current Affairs Today | Jayshree Ma''am

🎙Join Jayshree Ma''am Spotify Channel - https://open.spotify.com/episode/5TyM4VFX1X4LoX0MyfQWYF

PDF - https://drive.google.com/file/d/1viCtQZ3RarEuFI2Nv7Ep6n1d3MMpClIc/view?usp=sharing
📕SSC Pratham Foundation Batch 2026 :- https://careerwillapp.page.link/SLe3jVCn1oibxZs2A
📕 English Spl Batch By Ankul Sir - https://careerwillapp.page.link/8FjWdRZ3V27BaEZB8
📕UPSSSC LOWER PCS 2026 - https://careerwillapp.page.link/UhqV3Z5bHY4oJUFU7
📕 Maths Spl Batch By Rakesh Sir - https://careerwillapp.page.link/DvXNAFkVDnapYRzE7
📕UPP Constable (Sarthi Batch) -  https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
🔴𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 6.0 (New Batch 𝟐𝟎𝟐𝟔) 𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/LFF4SF9tEpi2ceaC6
📕 DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
📕UPSSSC 2026 Excise Constable : https://careerwillapp.page.link/21yZ', '2026-05-05 18:22:49', 16903, 1374, 57);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('QSNhm_HkNPE', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'India Under PM Modi''s Leadership | BJP Maharashtra Creates World Record | By Ankit Agrawal #Shorts', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/ANKITLIVE

Call Us for UPSC Counselling- 09240023293 / 76-4000-3000

Use code ‘ANKITLIVE ‘'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ANKITLIVE

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/23H7kxNScN

UPSC IAS (Mains) Mathematics Optional Live 2027-28 (Comprehensive) April Batch By Ankit Tiwari
Batch Starting on 15th May 2026 | Class Timing -12:00 PM   
To know more visit : https://studyiq.u9ilnk.me/d/8iDnHkktuj

Download our App for Dedicated UPSC Materials & Support - https://bit.ly/StudyiqApp

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Hindi Batch
बैच 7 मई 2026 से शुरू हो रहा है । बैच का समय शाम 6:00 बजे
Hurry Enroll Now : https://studyiq.u9ilnk.m', '2026-05-06 15:30:29', 173130, 8827, 95);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('RmKDUK0mIUM', 'UCx-7YPrGnNC81ahyqvqu27g', 'SSC में Selection चाहिए | तो पेश है Indi''s Top SSC Faculty | SSC Pratham Batch | SSC 2026', 'SSC में Selection चाहिए | तो पेश है Indi''s Top SSC Faculty | SSC Pratham Batch | SSC 2026
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
📕SSC Pratham Foundation Batch 2026 :-  https://careerwillapp.page.link/93DigSNFcZGsCDSj9
📕Maths Special (B-63 Recorded Batch 2026) Rakesh SIR:  https://careerwillapp.page.link/VZadpi4dV8Zdi8RUA
📕Maths Spl. (Recorded) B-62 (ADUTIYA SIR):  https://careerwillapp.page.link/V3GdoKSUpVkJH1bT9
📕DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
🔴𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 6.0 (New Batch 𝟐𝟎𝟐𝟔) 𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/LFF4SF9tEpi2ceaC6
📕UPP Constable (Paper Out Batch) - https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
📕 Delhi High Court (JJA) VOD Batch - https://careerwillapp.page.link/gTicVWjoBzfXTz9f6
📕 Railway Science Special - https://careerwillapp.page.link/hbrKbG4RAejowKus7



✅ Maths by Rakesh Yadav Sir, Abhinay Sir
✅ English by Jaideep Sir,Gopal Sir
✅ Reasoning by Piyush Sir,Arun Sir', '2026-05-06 14:21:32', 2942, 184, 1);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('SJ87Q8WOkyM', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'Ancient History Revision Through PYQ''s | History Marathon for UPSC Prelims 2026 | StudyIQ', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/SNLIVE

YouTube Series By Sainil Nagare: https://studyiq.u9ilnk.me/d/WgmvjEFXey

Call Us for UPSC Counselling- 76-4000-3000

Use code ''SNLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/SNLIVE

UPSC IAS (Mains) History Optional Live 2027-28 (Comprehensive) May Batch By Sainil Nagare : https://studyiq.u9ilnk.me/d/jhE5JIVvBG
Batch Starting on 20th May 2026 | Class Timing - 1:00 PM 
To know more visit : https://studyiq.u9ilnk.me/d/jhE5JIVvBG


UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/g3uy0tKN5W

Download our App for Dedicated UPSC Materials & Support - https://studyiq.u9ilnk.me/d/RQtp71j77l

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Hindi Batch
बैच 7', '2026-05-06 14:46:12', 10092, 227, 5);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('TGlybb0Tbcg', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'Indian Express Analysis | 7th May 2026 | Government Schemes & Initiatives for UPSC | StudyIQ', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/CSLIVE

YouTube Series By Chandan Sharma: https://studyiq.u9ilnk.me/d/3bjIDoVErf

Call Us for UPSC Counselling-  9240231046 / 76-4000-3000

Use code ''CSLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/CSLIVE

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/7kJQ1GC2FT

Download our App for Dedicated UPSC Materials & Support - https://studyiq.u9ilnk.me/d/wSS2EPnTp1

Indian Express Analysis | 7th May 2026 | Government Schemes & Initiatives for UPSC | StudyIQ 

The Union Cabinet has approved two massive semiconductor plants in Gujarat, marking a new phase for the India Semiconductor Mission (ISM). In today’s Indian Express analysis for May 7th , 2026, Ankit Agrawal ', '2026-05-06 15:10:40', 0, 1, 0);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('TjlDJLFIoeo', 'UCx-7YPrGnNC81ahyqvqu27g', 'Most Important Current Affairs Update | Breaking News of Past 24 Hours  #shorts #news #breakingnews', 'Most Important Current Affairs Update | Breaking News of Past 24 Hours  #shorts #news #breakingnews
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
📕SSC Pratham Foundation Batch 2026 :-  https://careerwillapp.page.link/93DigSNFcZGsCDSj9
📕Maths Special (B-63 Recorded Batch 2026) Rakesh SIR:  https://careerwillapp.page.link/VZadpi4dV8Zdi8RUA
📕Maths Spl. (Recorded) B-62 (ADUTIYA SIR):  https://careerwillapp.page.link/V3GdoKSUpVkJH1bT9
📕DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
🔴𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 6.0 (New Batch 𝟐𝟎𝟐𝟔) 𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/LFF4SF9tEpi2ceaC6
📕UPP Constable (Paper Out Batch) - https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
📕 Delhi High Court (JJA) VOD Batch - https://careerwillapp.page.link/gTicVWjoBzfXTz9f6
📕 Railway Science Special - https://careerwillapp.page.link/hbrKbG4RAejowKus7



✅ Maths by Rakesh Yadav Sir, Abhinay Sir
✅ English by Jaideep Sir,Gopal Sir
✅ Reasoning by Piyush Si', '2026-05-06 06:52:00', 8647, 687, 7);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('eZRTU5zUiZI', 'UCx-7YPrGnNC81ahyqvqu27g', 'SSC CGL 2025 | The Pundits MeetUp | Topper Meetup 🚀| Rakesh Yadav Sir', 'SSC CGL 2025 | The Pundits MeetUp | Topper Meetup | Rakesh Yadav Sir
#ssc #sscexam #sscgl #ssccglresult #ssccgltopper #ssccgl2026 #sscresult #rakeshyadavsir #careerwillapp #careerwill 
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
📕SSC Pratham Foundation Batch 2026 :-  https://careerwillapp.page.link/93DigSNFcZGsCDSj9
📕Maths Special (B-63 Recorded Batch 2026) Rakesh SIR:  https://careerwillapp.page.link/VZadpi4dV8Zdi8RUA
📕Maths Spl. (Recorded) B-62 (ADUTIYA SIR):  https://careerwillapp.page.link/V3GdoKSUpVkJH1bT9
📕DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
🔴𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 6.0 (New Batch 𝟐𝟎𝟐𝟔) 𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/LFF4SF9tEpi2ceaC6
📕UPP Constable (Paper Out Batch) - https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
📕 Delhi High Court (JJA) VOD Batch - https://careerwillapp.page.link/gTicVWjoBzfXTz9f6
📕 Railway Science Special - https://careerwillapp.page.link/hbrKbG4RAejowKus7

✅ Maths by Rakesh', '2026-05-06 08:00:42', 6072, 353, 10);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('hvBoFojbuXg', 'UCx-7YPrGnNC81ahyqvqu27g', 'Most Important Current Affairs Update | Breaking News of Past 24 Hours  #shorts #news #breakingnews', 'Most Important Current Affairs Update | Breaking News of Past 24 Hours  #shorts #news #breakingnews
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
📕SSC प्रथम 18 New Batch 2026 :-  https://careerwillapp.page.link/SLe3jVCn1oibxZs2A
📕Maths Special (B-63 Recorded Batch 2026) Rakesh SIR:  https://careerwillapp.page.link/VZadpi4dV8Zdi8RUA
📕Maths Spl. (Recorded) B-62 (ADUTIYA SIR):  https://careerwillapp.page.link/V3GdoKSUpVkJH1bT9
📕DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
📕𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 5.0 New Batch 𝟐𝟎𝟐𝟔 (𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/QcamEcnQ7Xvnp9AdA
📕UPP Constable (Paper Out Batch) - https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
📕 Delhi High Court (JJA) VOD Batch - https://careerwillapp.page.link/gTicVWjoBzfXTz9f6
📕 Railway Science Special - https://careerwillapp.page.link/hbrKbG4RAejowKus7


✅ Maths by Rakesh Yadav Sir, Abhinay Sir
✅ English by Jaideep Sir,Gopal Sir
✅ Reasoning by Piyush Sir,Arun S', '2026-05-05 06:02:00', 15427, 916, 20);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('lvxdhA7O1Go', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'BJP’s Biggest Political Weapon in Assam? | Delimitation | Hemanta Biswa Sharma | UPSC GS | StudyIQ', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/KJLIVE

YouTube Series By Karan Jindal: https://studyiq.u9ilnk.me/d/1uqG685crd

Call Us for UPSC Counselling- 76-4000-3000

Use code '' KJLIVE '' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/KJLIVE

General Studies, EPFO & IRLL Books Set Of 8 for EPFO Exam 2025 (Hindi Edition)  https://studyiq.u9ilnk.me/d/v9MgUYW65h

General Studies Books Set of 6 For EPFO Exam 2025 (Hindi Edition) https://studyiq.u9ilnk.me/d/zpzk9SOUGd

General Studies, EPFO & IRLL Books Set Of 8 Books for EPFO Exam 2025 (English Edition) https://studyiq.u9ilnk.me/d/EKXSb5lrhH

General Studies Books Set of 6 For EPFO Exam 2025 (English Edition) https://studyiq.u9ilnk.me/d/IwRNLKj3WK

Industrial Relations & Labour Laws for EPFO Exam (English Edition) https://studyiq.u9ilnk.me/d/lnduFxtxs5

UPSC IAS Live GS P2I Fou', '2026-05-06 16:13:18', 6346, 171, 20);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('t0o4Ax8wWMw', 'UCx-7YPrGnNC81ahyqvqu27g', 'SSC  में टॉप रैंक कैसे लाते हैं सफल स्टूडेंट्स  India''s Top SSC Faculty #shorts #ssc', 'SSC  में टॉप रैंक कैसे लाते हैं सफल स्टूडेंट्स  India''s Top SSC Faculty #shorts #ssc
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
📕SSC प्रथम 18 New Batch 2026 :-  https://careerwillapp.page.link/SLe3jVCn1oibxZs2A
📕Maths Special (B-63 Recorded Batch 2026) Rakesh SIR:  https://careerwillapp.page.link/VZadpi4dV8Zdi8RUA
📕Maths Spl. (Recorded) B-62 (ADUTIYA SIR):  https://careerwillapp.page.link/V3GdoKSUpVkJH1bT9
📕DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
📕𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 5.0 New Batch 𝟐𝟎𝟐𝟔 (𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/QcamEcnQ7Xvnp9AdA
📕UPP Constable (Paper Out Batch) - https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
📕 Delhi High Court (JJA) VOD Batch - https://careerwillapp.page.link/gTicVWjoBzfXTz9f6
📕 Railway Science Special - https://careerwillapp.page.link/hbrKbG4RAejowKus7


✅ Maths by Rakesh Yadav Sir, Abhinay Sir
✅ English by Jaideep Sir,Gopal Sir
✅ Reasoning by Piyush Sir,Arun Sir
✅ GS by Abhi', '2026-05-06 05:35:40', 4476, 267, 3);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('wVFPx1m4rQ0', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'Comfort Zone Will Kill Your UPSC Dream | 95% Won’t Make It | By Vasu Katara', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/ARGLIVE

Call Us for UPSC Counselling-  9240231046 / 76-4000-3000

To download the PDF: https://studyiq.u9ilnk.me/d/GENp0BzUnJ

Use code ''VASULIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ARGLIVE

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/Qu7HG2Hv3E

Download our App for Dedicated UPSC Materials & Support - https://studyiq.u9ilnk.me/d/RQtp71j77l

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Hindi Batch
बैच 7 मई 2026 से शुरू हो रहा है । बैच का समय शाम 6:00 बजे
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ilmfkWjzBT

UPSC IAS Live GS P2I Foundation 2027 Resolution May English Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurr', '2026-05-06 16:12:04', 1072, 28, 1);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('xXVa1aFOhU0', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'India Shocked | Punjab Twin Blasts | ISI Conspiracy & Khalistan Link | StudyIQ', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/CSLIVE

YouTube Series By Chandan Sharma: https://studyiq.u9ilnk.me/d/3bjIDoVErf

Call Us for UPSC Counselling-  9240231046 / 76-4000-3000

Use code ''CSLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/CSLIVE

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/7kJQ1GC2FT

Download our App for Dedicated UPSC Materials & Support - https://studyiq.u9ilnk.me/d/wSS2EPnTp1

India Shocked | Punjab Twin Blasts | ISI Conspiracy & Khalistan Link | StudyIQ

Punjab is on high alert after back-to-back twin blasts rocked Jalandhar and Amritsar near sensitive security installations. In this critical explainer, StudyIQ IAS analyzes the potential ISI-Khalistan nexus behind these exp', '2026-05-06 16:00:06', 9317, 269, 53);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('xohSmqLf4_U', 'UCx-7YPrGnNC81ahyqvqu27g', 'Careerwill क्यों है Top पर |  India''s Top Teaching Faculty For SSC Preparation | SSC  #shorts #ssc', 'Careerwill क्यों है Top पर |  India''s Top Teaching Faculty For SSC Preparation | SSC  #shorts #ssc
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
📕SSC प्रथम 18 New Batch 2026 :-  https://careerwillapp.page.link/SLe3jVCn1oibxZs2A
📕Maths Special (B-63 Recorded Batch 2026) Rakesh SIR:  https://careerwillapp.page.link/VZadpi4dV8Zdi8RUA
📕Maths Spl. (Recorded) B-62 (ADUTIYA SIR):  https://careerwillapp.page.link/V3GdoKSUpVkJH1bT9
📕DSSSB ASO NEW BATCH 2026: https://careerwillapp.page.link/q4TCivKSV5u8HXW17
📕𝐑𝐚𝐢𝐥𝐰𝐚𝐲 𝐅𝐨𝐮𝐧𝐝𝐚𝐭𝐢𝐨𝐧 5.0 New Batch 𝟐𝟎𝟐𝟔 (𝐑𝐑𝐁 𝐍𝐓𝐏𝐂, 𝐆𝐑𝐎𝐔𝐏-𝐃, 𝐀𝐋𝐏, 𝐓𝐄𝐂𝐇𝐍𝐈𝐂𝐈𝐀𝐍 𝐏𝐌, 𝐒𝐂 & 𝐑𝐏𝐅 𝐂𝐎𝐍𝐒𝐓𝐀𝐁𝐋𝐄/𝐒𝐈) :- https://careerwillapp.page.link/QcamEcnQ7Xvnp9AdA
📕UPP Constable (Paper Out Batch) - https://careerwillapp.page.link/AFhPq9xPSRxR7gGP6
📕 Delhi High Court (JJA) VOD Batch - https://careerwillapp.page.link/gTicVWjoBzfXTz9f6
📕 Railway Science Special - https://careerwillapp.page.link/hbrKbG4RAejowKus7


✅ Maths by Rakesh Yadav Sir, Abhinay Sir
✅ English by Jaideep Sir,Gopal Sir
✅ Reasoning by Piyush Sir,Arun Si', '2026-05-04 14:19:27', 10961, 415, 16);
INSERT INTO videos (video_id, channel_id, title, description, published_at, view_count, like_count, comment_count) VALUES ('zNTE69i8apc', 'UCrC8mOqJQpoB7NuIMKIS6rQ', 'Modi Tattva: शिक्षा का ‘मोदीकरण’? | RSS & Saffronization | Dr Pankaj Mishra | StudyIQ IAS', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/4ekxQyFxsI
Call Us for UPSC Counselling- 76-4000-3000
Use code ''PKLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/4ekxQyFxsI

UPSC IAS Live GS P2I Foundation 2028 Nirmaan May Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ue38vripch

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Hindi Batch
बैच 7 मई 2026 से शुरू हो रहा है । बैच का समय शाम 6:00 बजे
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/KJvuipysos

UPSC IAS Live GS P2I Foundation 2027 Resolution May English Batch
Batch Starting on 7th May 2026 | Daily Live Classes at 6:00 PM
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/7e9LKzgUIQ

UPSC IAS (Mains) LIVE Optional Batches : https://studyiq.u9ilnk.me/d/9ahtTDzlmA

For UPSC IAS Offline Classes Please', '2026-05-06 15:30:06', 6465, 261, 92);

-- TABLE: comments
DROP TABLE IF EXISTS comments;
CREATE TABLE `comments` (
  `comment_id` varchar(100) NOT NULL,
  `video_id` varchar(50) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `comment_text` text DEFAULT NULL,
  `like_count` int DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `sentiment_label` varchar(20) DEFAULT NULL,
  `sentiment_score` float DEFAULT NULL,
  PRIMARY KEY (`comment_id`) /*T![clustered_index] CLUSTERED */,
  KEY `fk_1` (`video_id`),
  CONSTRAINT `fk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw-Tbv9FWdWnHivz_F4AaABAg', 'eZRTU5zUiZI', '@Preetimaurya-w9l', 'Bharat Sir 😊', 3, '2026-05-06 08:25:32', 'POSITIVE', 0.9897);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw-UpQKhNz19W7ZPk14AaABAg', 'hvBoFojbuXg', '@All_Gaming_Shorts793', 'Thanks you ma''am', 2, '2026-05-05 07:17:57', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw27K02S17u81Vm46V4AaABAg', 'TjlDJLFIoeo', '@PritiSaini-b3g', 'thank youuuuuuu so ma''am ma''am  for this given information. ......😍🥰🫶✨
very helpful information ❤❤🙏🙏💐💐', 0, '2026-05-06 07:32:10', 'POSITIVE', 0.9979);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw2kbF24q3NP8zFoNl4AaABAg', 'zNTE69i8apc', '@rekhabage1478', 'Thanks 🙏 sir ji nice session', 1, '2026-05-06 16:34:43', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw2u7uCqmBOi4pzi1F4AaABAg', 'QSNhm_HkNPE', '@Y_Thakare_88', 'Kuch bkl be like:- Nahi india me to road''s hi nahi hai tunnel to dur hi hai 🫪', 0, '2026-05-06 19:11:03', 'NEGATIVE', 0.9937);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw31_UeA4eVGVUd-hJ4AaABAg', 'zNTE69i8apc', '@sapindersingh5526', 'Kya sikhiaa ge..ki jhooth kaise botle hai.. election kaise hack krtr hqii..', 10, '2026-05-06 15:38:27', 'NEGATIVE', 0.9959);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw322_3CykDD45FbyF4AaABAg', 'QSNhm_HkNPE', '@VaibhavMishra-g2z', 'Ye sab adani aur ambani ko fayda dene ke liye bana hai.', 0, '2026-05-06 18:21:59', 'NEGATIVE', 0.9205);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw70ArYuql9h6cYm9p4AaABAg', '2T6c77uuqbk', '@roshanikhatun-n9v', 'Thank you so much mam ji 🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏', 1, '2026-05-06 04:34:42', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw7DZ46KGRpNCLre_B4AaABAg', 'QFMIcAB_QLI', '@Hotoaye-og8jm', 'Thank u man 🎉😊', 0, '2026-05-05 05:28:05', 'POSITIVE', 0.9995);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugw9tjMPRFGy7Tp2DTZ4AaABAg', 'eZRTU5zUiZI', '@LalanKumar-t2m1f', 'Editor ko salute ❤❤❤', 2, '2026-05-06 10:21:46', 'POSITIVE', 0.7046);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwAous_-b6nbIfpxt14AaABAg', 'AbeTMM-WlT8', '@hariomkumar-cs4hb', 'Best explan', 1, '2026-05-06 17:15:27', 'POSITIVE', 0.9992);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwAxS_HA4slujkwd494AaABAg', 'QSNhm_HkNPE', '@ShubhamChavan_21', 'Chamche AI bol rhe hai😂😂', 31, '2026-05-06 16:43:35', 'NEGATIVE', 0.6794);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwCfTeYcZy47l3GSrN4AaABAg', 'xXVa1aFOhU0', '@nightswithd', 'waiting for op sindoor 2 start it please we cant wait more here', 0, '2026-05-06 18:08:48', 'NEGATIVE', 0.9967);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwE4XBzzoS9i74BVkB4AaABAg', 'QSNhm_HkNPE', '@debangondey', 'Bapre kya baat hain paaji par iska kya karenge 😂 . Matlab kuch bhi 😂 . Tax payer money wasted but dekhte hain kitne din chalta hain', 0, '2026-05-06 17:49:35', 'NEGATIVE', 0.9986);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwEmn9Edm-R0Ikj52t4AaABAg', 'zNTE69i8apc', '@rudrapratap4740', 'पहले कांग्रेस से परेशान थे, अब मोदी ने परेशान  कर रखा है 😂😂', 1, '2026-05-06 18:15:19', 'NEGATIVE', 0.8503);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwEy9jPqmVB33e8mRh4AaABAg', 'AbeTMM-WlT8', '@Abhayw01', 'Saifuddin Soz की पार्टी उस समय Atal Bihari Vajpayee की NDA सरकार को support कर रही थी। फिर भी Soz ने पार्टी whip के खिलाफ जाकर सरकार के खिलाफ वोट दे दिया, जिससे सरकार 1 वोट से हार गई।', 2, '2026-05-06 19:02:01', 'NEGATIVE', 0.9302);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwGApHAEMEdAk_qzJF4AaABAg', 'QSNhm_HkNPE', '@Hinduyodha7898', 'Keep it up Bharat..
❤', 0, '2026-05-06 18:51:06', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwG_-gXzNEJSSTsMv14AaABAg', 'QSNhm_HkNPE', '@Amy_D_Cruz', '😢😢😢😢😢😢 Sinkholes, mountain debasement !!', 0, '2026-05-06 16:28:15', 'NEGATIVE', 0.9995);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwH_tZxg1xD8GeUpKB4AaABAg', 'xXVa1aFOhU0', '@ksg9809', '1:01', 0, '2026-05-06 18:09:33', 'POSITIVE', 0.9556);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwHofTK7Z1UnWFLKQB4AaABAg', 'QSNhm_HkNPE', '@blackyt2870', 'Development in Maharashtra : 🥰
Development in Bihar : 💩', 1, '2026-05-06 17:12:56', 'POSITIVE', 0.932);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwJFy_jjFTH6-CKjY54AaABAg', 'zNTE69i8apc', '@sssingh290', 'विनाश ने गति तेज पकड़ ली', 15, '2026-05-06 16:20:51', 'POSITIVE', 0.5094);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwJG57k8hpOFYWvSjl4AaABAg', 'A8v_BlhgKgg', '@lovetosanatani', 'Mere jatav samaj ne muje alag diya hai to kya mere bacho ki bhi galati hai', 0, '2026-05-06 16:52:25', 'NEGATIVE', 0.9881);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwJm1MA_sjb7qBzw8p4AaABAg', 'QFMIcAB_QLI', '@SunitaDevi-q8y9s', 'Ssc stenographer ke liye bhi h', 0, '2026-05-05 06:44:03', 'NEGATIVE', 0.6832);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwJwDJIzaOBvB8bIKV4AaABAg', 'xXVa1aFOhU0', '@top1-e1w', 'I am maratha but huge respect to Sikhs and Rajputs🚩', 10, '2026-05-06 17:25:01', 'POSITIVE', 0.9982);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwLNdKKuG0jk5MsH_B4AaABAg', 'QSNhm_HkNPE', '@moxorax', 'Siliguri needs a tunnel too', 0, '2026-05-06 19:27:00', 'NEGATIVE', 0.9978);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwLvy9Az7Lai4vEOaJ4AaABAg', 'lvxdhA7O1Go', '@GreatSkill11', 'Sir every 5 year hona chahiye', 2, '2026-05-06 15:26:42', 'POSITIVE', 0.9875);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwN1qYtkThKNBHOsLl4AaABAg', 'QFMIcAB_QLI', '@Adarsh-i2q7b', '❤❤❤❤', 0, '2026-05-05 03:56:49', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwNMVLsqMhlZVIdt494AaABAg', 'zNTE69i8apc', '@Monika_PhD', 'you seems very helpless in this lecture. Ranting your frustration out instead of actually presenting yourself neutral. All the countries around the world studied their political leaders who at time had a great career? What is wrong in it? Even from academic point of view ..', 0, '2026-05-06 17:23:17', 'NEGATIVE', 0.9994);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwOGNjoV_khtuNzknR4AaABAg', 'QSNhm_HkNPE', '@sudoandroidgaming562', 'Bengal hinsa pr video banao manipur ban gya😂😂', 0, '2026-05-06 17:40:51', 'NEGATIVE', 0.9918);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwOv-e_hmdXiv9ZV9R4AaABAg', '2T6c77uuqbk', '@vikrantkumar4967', 'Maam spotify me continue class diya kigyr plzz', 0, '2026-05-06 06:17:06', 'NEGATIVE', 0.9768);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwPCoHyi720OzgDjz14AaABAg', 'TjlDJLFIoeo', '@All_Gaming_Shorts793', 'Thanks you ma''am', 1, '2026-05-06 11:01:55', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwPY135W2T01Ktuhcx4AaABAg', 'eZRTU5zUiZI', '@shivsagarvilogs', 'Mai bhi ek din aunga sir apse milne', 3, '2026-05-06 08:22:05', 'POSITIVE', 0.8966);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwQrlikH0gEpJqVMax4AaABAg', 't0o4Ax8wWMw', '@Radio09foya', 'Jaldi kijiye', 0, '2026-05-06 07:51:04', 'POSITIVE', 0.5662);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwTKBG1ZJ_3V0BC1TF4AaABAg', 'hvBoFojbuXg', '@aspirantkavitakushwaha9370', 'thanks ma''am jir❤', 0, '2026-05-05 16:07:20', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwTzmGTPen92oQljgl4AaABAg', '2T6c77uuqbk', '@AKHILPANCHAL-q1g', 'Mam mujhe discussion group nhi mil rha hai plz bataye', 1, '2026-05-06 03:20:35', 'NEGATIVE', 0.9881);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwUVVfrGOG9yIjfRUp4AaABAg', 'QSNhm_HkNPE', '@BibekPal-m7b', 'Itna bara road laka karanga kaya ?', 1, '2026-05-06 15:40:06', 'NEGATIVE', 0.9919);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwW-PT4R_EuQeLkEhF4AaABAg', 'A8v_BlhgKgg', '@lovetosanatani', 'Mere bacho ko jatav samaj se kyu nikal diya hai ye question puchhogey..kya koi 21st century mai samaj se nikal sakta hai mere bacho ki kya galati hai', 2, '2026-05-06 16:53:28', 'NEGATIVE', 0.978);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwWF15pVAcxJ1xcFbF4AaABAg', 'QSNhm_HkNPE', '@rahuljha3657', 'Sir kash aise hi environment ka v khayal rakhti government.. kash..', 0, '2026-05-06 16:47:09', 'POSITIVE', 0.929);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwWXUjhNrBKWtu_tIh4AaABAg', 'zNTE69i8apc', '@wentormenon', 'It is needed ❤🇮🇳🚩✌️', 4, '2026-05-06 16:08:05', 'NEGATIVE', 0.7647);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwWwS2B8rKNs05v8iB4AaABAg', 'lvxdhA7O1Go', '@ray-y6x-b1o', 'iski behad jarurat thi avi k time me  ....from Assam', 5, '2026-05-06 17:14:32', 'NEGATIVE', 0.5965);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwYQNh1e4fkcyBJF9F4AaABAg', 'QFMIcAB_QLI', '@luckyaryanraja555', 'thanku mam', 0, '2026-05-06 10:00:23', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwZA9Glz8LOCosSw794AaABAg', 'QSNhm_HkNPE', '@REALLIFERUPESH', 'हमारे राजस्थान में भी एक 80 हजार करोड़ की रिफाइनरी का उद्घाटन होने वालाथा।  पर उसमें किसी ने आग लगाई कभी पता भी नहीं चलेगा।', 7, '2026-05-06 16:23:23', 'NEGATIVE', 0.7944);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwZWulXRMoUO0P_3ml4AaABAg', 'QSNhm_HkNPE', '@aritrabiswas7063', 'Wo patthar heart ka shape ka hai', 6, '2026-05-06 17:17:57', 'NEGATIVE', 0.6327);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwZl1apqy6MrkYNWBp4AaABAg', 'QSNhm_HkNPE', '@psycho_079', 'Andhnamaji nhi mane ge 😂', 194, '2026-05-06 15:56:04', 'NEGATIVE', 0.8174);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwbAXW9RLJ1D96Lwp54AaABAg', '2T6c77uuqbk', '@Sonam-y2r1p', 'History class mam please start kar wa do', 0, '2026-05-06 06:52:21', 'NEGATIVE', 0.8852);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwbRiINfOZcn7ImQM94AaABAg', 'zNTE69i8apc', '@Durgesh-Singh-Chouhan', 'Nice video sir ❤', 0, '2026-05-06 20:26:48', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwbmGidlAyIh7nqI_d4AaABAg', '2T6c77uuqbk', '@AnkitRaaj-n2k', 'Thanks❤', 0, '2026-05-06 06:23:12', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwc-OAQ-fWWxhlR-SR4AaABAg', 'QFMIcAB_QLI', '@amankumar-h1d8w', 'Pdf', 0, '2026-05-05 14:58:48', 'POSITIVE', 0.7824);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwcFKmZeSFhgTbGT-14AaABAg', 'QFMIcAB_QLI', '@Railway_Aspirants_badalmaurya', 'Thank you sir', 0, '2026-05-05 08:48:18', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwcLxzF2rjOMiYnp5J4AaABAg', '2T6c77uuqbk', '@AnuRaj-f1i', 'Et कोयला  is best कोयला mam ji', 1, '2026-05-06 14:00:23', 'POSITIVE', 0.7269);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwd7nR2e4wlxIWijll4AaABAg', 'xXVa1aFOhU0', '@Angel-g2u8e', 'Thank you for respecting Punjab and Punjabis Sir.. Waheguru ji bless you with more success and good health 🙏', 5, '2026-05-06 17:07:04', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwdHaKrGlEcK1p2P3B4AaABAg', 'eZRTU5zUiZI', '@NeeshuYadav-g7o', 'Jandar🔥🔥   sandar❤️❤️❤️❤️  Rakesh sir', 2, '2026-05-06 10:46:23', 'POSITIVE', 0.9797);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwdPe9VZGsDcO4_lGJ4AaABAg', 'QFMIcAB_QLI', '@pk_9119', 'Ma''am pdf to dal diya kro plz', 0, '2026-05-05 04:26:06', 'NEGATIVE', 0.9856);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwdeH0Hq0bOygoYGYd4AaABAg', 'xXVa1aFOhU0', '@aur2864', 'Free Khalistan 😮😮😮', 0, '2026-05-06 18:17:05', 'POSITIVE', 0.9909);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwenbjPl2PHfCSUvxx4AaABAg', 'QFMIcAB_QLI', '@Study.1-j3w', 'Respect for you maam', 0, '2026-05-06 04:01:04', 'POSITIVE', 0.9995);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwfEwK1uNeK3N-IHlh4AaABAg', '2T6c77uuqbk', '@Onlystudy-l7y', 'MIND BLOWING CLASS GURU MAA 🥰🥰
THANK YOU SO MUCH MAM 🙏
AAP BAHUT BAHUT ACHA PADHTE HO MAM 🥰🥰🥰🥰🥰🥰🙏', 1, '2026-05-06 03:23:19', 'NEGATIVE', 0.9792);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwff0JhCTXSg2Zu3np4AaABAg', 'lvxdhA7O1Go', '@rupjitpaul932', 'We are from Assam and we are happy with it ❤', 8, '2026-05-06 17:06:47', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwg14gTOwqHk5WmakB4AaABAg', 'zNTE69i8apc', '@munnu2022', 'Meine dekha tha..', 0, '2026-05-06 17:13:49', 'NEGATIVE', 0.9854);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwg1VgIgtT8LIyFii54AaABAg', '2T6c77uuqbk', '@HarHarMahadev-p1f', '🕉️ Very nice season Thank you so much Ma''am ji 🙏😊💯🔥', 1, '2026-05-06 03:20:17', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwgoyQyRRTn8UYtIoR4AaABAg', 'zNTE69i8apc', '@mythoughts-u2o', 'What kind of introduction is this guy given at starting. He has completely distorted social politics into his own ideological leaning. How can he is teacher when he is leaning towards other side and criticizing even before publishing.', 0, '2026-05-06 18:08:31', 'NEGATIVE', 0.9799);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwgtePNxpdnOJAYHup4AaABAg', 'QFMIcAB_QLI', '@md.naseemahmad1641', 'Good morning Mam', 0, '2026-05-05 15:50:46', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwjo33_AmstHQnoHh14AaABAg', '2T6c77uuqbk', '@priyanshibhandari8630', 'Mam ap history bhi bhut acha padhati ho please medieval India padha dijiye 🙏', 2, '2026-05-06 06:00:55', 'POSITIVE', 0.9589);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwlAukrOOnc-6ZlKn14AaABAg', 'QFMIcAB_QLI', '@kaushikhere20', 'mam arunachal ka local language hindi hai', 0, '2026-05-05 07:26:07', 'NEGATIVE', 0.8914);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwlC7UA1lsiz8DK7pF4AaABAg', 'zNTE69i8apc', '@princekumarpryagi8299', 'Iss sajjan ko kya taklif h bhi...😂😂😂', 0, '2026-05-06 20:27:51', 'NEGATIVE', 0.8325);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwlTVn9n9h_yxdirtd4AaABAg', '2T6c77uuqbk', '@luckyaryanraja555', 'thanku mam', 0, '2026-05-06 12:32:31', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwqt7tAo-Ck07S5hIJ4AaABAg', '2T6c77uuqbk', '@ShivamKumar-w8r5d', 'Nice class mam', 2, '2026-05-06 05:40:07', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwsvYrQ6OJjxo_9Yf54AaABAg', 'QSNhm_HkNPE', '@psycho_079', 'Indian developing speed before 2014 🤡📉.   Indian developing speed after 2014 📈🗿 🚅', 20, '2026-05-06 15:55:19', 'POSITIVE', 0.5504);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwszTrrrwjFldB-hAB4AaABAg', 'xXVa1aFOhU0', '@CryptosPredator', '💪Ab raaj kray ga Khalsa 👳🏻‍♂️❤🇵🇰', 0, '2026-05-06 20:36:42', 'NEGATIVE', 0.9861);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwtgWydKJjEtzni6Jt4AaABAg', '2T6c77uuqbk', '@Suchitadas-x2e', '😢', 0, '2026-05-06 11:40:35', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwuHxhGBTqyvqQPjSl4AaABAg', 'xohSmqLf4_U', '@Study.1-j3w', 'Careerwill is world best plateform', 0, '2026-05-06 04:00:16', 'POSITIVE', 0.9989);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwuI6vfdlOoPwCUu254AaABAg', 'QSNhm_HkNPE', '@anuragkumarthakur5560', 'Thank you Sir for this information', 0, '2026-05-06 18:34:46', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwx8XN8aa9t9yiK9yd4AaABAg', 'QFMIcAB_QLI', '@SuruchiKumari-m7r', 'State bihar district patna and village ranisaray', 0, '2026-05-05 09:45:51', 'POSITIVE', 0.8308);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwxoi2U2VUqc5WDDh54AaABAg', 'AbeTMM-WlT8', '@vijay4441Dost', 'जय हिन्द 🇮🇳🇮🇳', 1, '2026-05-06 17:39:52', 'NEGATIVE', 0.7579);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwy6CefI5LlxC77QgR4AaABAg', 'xXVa1aFOhU0', '@CryptosPredator', 'Free Khalistan ❤ ab raaj kray ga ''Khalsa💪', 0, '2026-05-06 20:31:10', 'NEGATIVE', 0.9907);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgwypvWOWb2cIE2kK-14AaABAg', 'zNTE69i8apc', '@arpitdikkar', 'RSS❤', 0, '2026-05-06 18:12:31', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugwz74WVbyuZZDgNT1J4AaABAg', 'hvBoFojbuXg', '@मुसाफ़िर______________व3ज', 'thank you mam 🙏❤❤🎉', 0, '2026-05-05 06:28:39', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx25wPsMKhz4-hTtWN4AaABAg', 'QFMIcAB_QLI', '@Cartoongyan8', 'Maam 1 may sa 22 april ki pdf upload ho rahi hai , haar din ki pdf upload kar dijiye maam plz', 0, '2026-05-05 04:45:40', 'NEGATIVE', 0.9971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx4bYmJ_RkJPCTnG_J4AaABAg', 'zNTE69i8apc', '@MKBharatAffairs', 'Achhi bat hai kewal foreigners ko he kyu pdhna hme Bharat ke bare me bhi jarur pdhna chahiye..', 17, '2026-05-06 15:48:20', 'NEGATIVE', 0.9853);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx58elK_z0JYulNWex4AaABAg', 'lvxdhA7O1Go', '@ThomasBodo-l3o', 'Good sir 👍 💯', 0, '2026-05-06 19:55:16', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx6cssPyK-hDiiJbP94AaABAg', 'zNTE69i8apc', '@myrsvly', 'ye joker hamesha sahi chizo ko galat tarike se padhata karta he', 0, '2026-05-06 17:08:16', 'NEGATIVE', 0.9475);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx7-ZKnEu2eW00OQpV4AaABAg', 'A8v_BlhgKgg', '@krishanagopala11', 'Superb explanation 💫', 2, '2026-05-06 16:45:23', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx7FncV4o2SdKxng894AaABAg', '2T6c77uuqbk', '@NisthaSingh-t4x', 'Mam History class resume kar dejiye please mam 🙏', 0, '2026-05-06 05:00:19', 'NEGATIVE', 0.9744);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx8Ej2ztrgTWWcKdMx4AaABAg', '2T6c77uuqbk', '@kamaljitsingh1749', 'hlo jayshree mam first of all thnkuu soo much to giving us superb content on youtube regarding current affairs mam please i have one query mam plese put ths weekly test in mcq form at carreewil app bcs its very hlpfull please mam if you see my this comment please do this bcs after 18 april you did not put any weekly test on app.thnkuu so much mam and if any mistake so sorry', 0, '2026-05-06 07:02:45', 'NEGATIVE', 0.98);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx8J26QNw4SuRWEkO94AaABAg', 'hvBoFojbuXg', '@bishnupriyamohanty3099', '❤', 1, '2026-05-05 06:12:14', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx8OSOKq0n5E8pkmv94AaABAg', 'A8v_BlhgKgg', '@noize2sound', 'They promote you to eliminate Ambani & Adani but they never question families who are ultra rich from past 200-300 years without doing any manufacturing. In my opinion Marxism is ultra rich people''s experiment to keep hard working people away', 0, '2026-05-06 18:02:07', 'POSITIVE', 0.9895);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx8Phj5Bv6EaBJdYN14AaABAg', 'xohSmqLf4_U', '@R444ytr', 'Classes kab se live hogi', 0, '2026-05-05 03:30:56', 'NEGATIVE', 0.9641);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx8vFB3ABmMufUT1Eh4AaABAg', '2T6c77uuqbk', '@NisthaSingh-t4x', 'Stenographer ki GS ke liye bhi kuch layee', 0, '2026-05-06 05:07:35', 'NEGATIVE', 0.8962);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx9VqPiooRMxqhQ87F4AaABAg', 'QFMIcAB_QLI', '@kajalmishra6970', 'Good morning mam', 1, '2026-05-05 03:38:15', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxCfJrK9jR3LwilMfl4AaABAg', 'zNTE69i8apc', '@user-j7y9wIl', 'मुग़लइज़म हुआ तब कोई बोला नहीं', 2, '2026-05-06 15:57:38', 'NEGATIVE', 0.8153);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxDI-ss6mL91wd1unB4AaABAg', 'xXVa1aFOhU0', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses: https://studyiq.u9ilnk.me/d/CSLIVE

Call Us for UPSC Counselling- 9240231046

Use code ''CSLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch  : https://studyiq.u9ilnk.me/d/CSLIVE', 1, '2026-05-06 15:46:10', 'NEGATIVE', 0.9659);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxGPQqVFA17EbPFgQ14AaABAg', '2T6c77uuqbk', '@AKHILPANCHAL-q1g', 'Mujhe bhut sare questions yad hai jo paper me aaye the', 2, '2026-05-06 03:21:37', 'NEGATIVE', 0.9359);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxGk-eM1980AizCP-R4AaABAg', 'QFMIcAB_QLI', '@PoonamRAWAT-d5k', 'I am from mp', 0, '2026-05-05 04:16:10', 'POSITIVE', 0.923);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxIP1WaWfAb1HdQrxt4AaABAg', 'lvxdhA7O1Go', '@RanjanPB31', 'Sir we are assamese and we are happy with delimitation. So here all arguments end.', 8, '2026-05-06 16:30:32', 'POSITIVE', 0.9965);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxKNCTu60hw7PEAOat4AaABAg', 'lvxdhA7O1Go', '@ravikumar-xk4kp', 'Burnol movement Sir😂', 5, '2026-05-06 15:47:37', 'NEGATIVE', 0.9969);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxKzOlrQPuhU1QihbB4AaABAg', 'QSNhm_HkNPE', '@Sandeep-M', 'इतना चौड़ी सुरंग वाला रोड बना कर हम क्या करेंगे😂?', 1, '2026-05-06 17:07:08', 'NEGATIVE', 0.9253);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxL4Juge5ASMO7Bxht4AaABAg', 'lvxdhA7O1Go', '@ajinkyabhosale9295', 'Is sajjan ko kya dikkat hai bhai 😂', 3, '2026-05-06 17:40:09', 'NEGATIVE', 0.6559);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxLu3eZ2H-LsbmMEEd4AaABAg', 'xXVa1aFOhU0', '@SyedHassanRH', 'Freedom for KHALISTAN 👑', 2, '2026-05-06 20:25:32', 'POSITIVE', 0.9988);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxN83bJD-k9eRz8w5p4AaABAg', 'hvBoFojbuXg', '@AMITKUMAR-fr4kv', '❤🙏', 0, '2026-05-05 07:11:26', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxOK3m4ETdX_mIYect4AaABAg', 'QSNhm_HkNPE', '@Entertainmentcomedy24', 'Some people What is the benefit of the tonnal turntable when toll tax token is issued as quickly 😂', 46, '2026-05-06 15:53:21', 'NEGATIVE', 0.9637);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxQ1dXufZgKDFzHS854AaABAg', 'lvxdhA7O1Go', '@SITCOM000', 'Assam me development to hua he isme koi Shaq nahi but freebie ko Rich and Govt job walo ke liye band kar diya jaye to Assam ka Economic growth 💹📈 jada hoga mujhe lagta he ❤', 1, '2026-05-06 18:52:45', 'NEGATIVE', 0.9515);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxTgQJNc7VPnuUdJbh4AaABAg', 'QSNhm_HkNPE', '@ππππππ-ξ8ε', 'Kab tak express way toot jayega', 0, '2026-05-06 20:02:01', 'NEGATIVE', 0.9204);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxWZ3EQ0o_XGmKwPW94AaABAg', 'lvxdhA7O1Go', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/KJLIVE

Call Us for UPSC Counselling- 76-4000-3000

Use code '' KJLIVE '' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/KJLIVE', 0, '2026-05-06 14:43:04', 'NEGATIVE', 0.9638);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxWutkEhrd1ab_T1614AaABAg', 'QSNhm_HkNPE', '@shubhrajitsinghaytuser', 'Do we really need this tunnel? Zameen to hum shovel se bhi khud denge?', 4, '2026-05-06 16:45:57', 'NEGATIVE', 0.9982);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxXKkyr_mbVxrf3gVV4AaABAg', 'zNTE69i8apc', '@shubhusinghpcb9092', 'Fenkna sikhayenge kya 😂😂', 12, '2026-05-06 15:45:27', 'NEGATIVE', 0.6223);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxXQHedIW1-WxlvnLZ4AaABAg', 'zNTE69i8apc', '@PriyankaKumari-qb1xn', 'Hi sir', 0, '2026-05-06 15:32:36', 'POSITIVE', 0.999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxY9ZHt-iflrmykUgV4AaABAg', 'QSNhm_HkNPE', '@karnenduroy5595', 'Good 👍', 0, '2026-05-06 16:49:28', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxYZVELN_QSOuG4gNd4AaABAg', 'QSNhm_HkNPE', '@crictalk6326', 'Dekhenge kitne din Tak tikata hai wo bridge', 0, '2026-05-06 17:11:23', 'NEGATIVE', 0.9589);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugx_Sn4xe8NwMZ8f67x4AaABAg', 'A8v_BlhgKgg', '@DebankurSarkar', 'Best of luck to Jio ❤', 4, '2026-05-06 18:42:04', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxcsFPfNySvmjzrRox4AaABAg', 'xXVa1aFOhU0', '@rantac01', 'Election campaigning started!', 3, '2026-05-06 18:00:06', 'POSITIVE', 0.9962);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxdU0XDOuCL1qBUMRd4AaABAg', 'SJ87Q8WOkyM', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/SNLIVE

Call Us for UPSC Counselling- 76-4000-3000

Use code ''SNLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/SNLIVE', 0, '2026-05-06 14:42:25', 'NEGATIVE', 0.9661);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxeNulvJIIUjqN0qjZ4AaABAg', 'QSNhm_HkNPE', '@abhirupjana9939', 'Germany - Kiya humne iss bridge ki zarurat thi 😂😂', 1, '2026-05-06 19:28:01', 'NEGATIVE', 0.9795);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxfoYp-PqmECkM2zdt4AaABAg', 'xXVa1aFOhU0', '@PankajSharma-df8yp', 'Udta Punjab...!! Under AAP', 24, '2026-05-06 16:06:56', 'NEGATIVE', 0.8198);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxgsUU-PJDD9dBFaMB4AaABAg', 'QSNhm_HkNPE', '@choyang26', '14 saal laga 😅', 0, '2026-05-06 19:20:24', 'NEGATIVE', 0.9888);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxj-Xtu5ArttFoDpSx4AaABAg', 'zNTE69i8apc', '@xhiping5190', 'dictatorship', 5, '2026-05-06 15:55:57', 'NEGATIVE', 0.9988);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxjO490stGbxxP7OD14AaABAg', 'QFMIcAB_QLI', '@SharwanpanditSharwanpandit', 'Thank you so much ma''am', 0, '2026-05-06 10:16:27', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxjUbNVtxdLcd3bE9t4AaABAg', 'QSNhm_HkNPE', '@shahbazansari9837', '70,000 crore project 
6500 crores corruption', 0, '2026-05-06 18:25:38', 'NEGATIVE', 0.9971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxmw-Zxo0ReZy1j0gp4AaABAg', 'zNTE69i8apc', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses: https://studyiq.u9ilnk.me/d/4ekxQyFxsI

Call Us for UPSC Counselling- 76-4000-3000

Use code ''PKLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch : https://studyiq.u9ilnk.me/d/4ekxQyFxsI', 0, '2026-05-06 15:07:02', 'NEGATIVE', 0.9654);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxn0ryjkzNJ3MqZJk94AaABAg', 'QSNhm_HkNPE', '@rafeshaikh6089', 'Btw ya fadnavis na nai ajit dada pawar aur udhav thakre na banaya tha', 0, '2026-05-06 19:29:50', 'NEGATIVE', 0.9926);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxn1BS5N9iZt8rNLi54AaABAg', 'xohSmqLf4_U', '@vishal-o7bv9', 'Sir batch to purchase kr liya but class kb se live start hogi', 0, '2026-05-05 03:37:15', 'NEGATIVE', 0.9916);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxnozkE_OVL78Li9N14AaABAg', 'lvxdhA7O1Go', '@amitrajdubey', 'New hack restored😊😊😊', 1, '2026-05-06 16:41:21', 'NEGATIVE', 0.9951);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxpb7JD_9a-xDWVjQR4AaABAg', '2T6c77uuqbk', '@All_Gaming_Shorts793', 'Thanks you so much ma''am', 1, '2026-05-06 06:20:29', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxphaaGHGHp3mj4zK54AaABAg', 'zNTE69i8apc', '@Abhishek.Bharatmatakijai', 'Kya dikkat hai padhaya ja raha to 
केपीटलाइज्म सोशलिज्म पार्टी आईडियोलॉजी कार्ल मार्क्स को पढ़ाया जा सकता है तो हिंदुत्व rss को क्यों नहीं पढ़ाया जा सकता ?
मुझे इसमें कुछ गलत नहीं लगता, हिंदुत्व rss को तो पूरे भारत में पढ़ाया जाना चाहिए 

और यह भी सच है कि मोदी जैसा कोई नहीं,, मोदी  और लीडरशिप और उसके जैसा कोई नहीं है आज वह नेहरू से भी ऊपर है

मार्क्स की कोई जरूरत नहीं , इसकी वजह से लोग गरीबी में ही जाते हैं', 6, '2026-05-06 16:20:10', 'NEGATIVE', 0.9584);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxpiOgy4dggALSbBaN4AaABAg', 'hvBoFojbuXg', '@HarHarMahadev-p1f', '🕉️ Very nice information Thank you so much Ma''am ji 🙏😇💯🔥', 0, '2026-05-05 06:28:38', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxqBuBVZSbJ6ryym6p4AaABAg', 'eZRTU5zUiZI', '@amit11-1', 'Abhinay sir se milna hai', 3, '2026-05-06 11:39:24', 'POSITIVE', 0.9919);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxquZHzwpgy0qumthN4AaABAg', 'eZRTU5zUiZI', '@Engineer_Ankul_7415', 'चमकेंगे हम भी एक दिन🎉🎉🎉🎉🎉🎉🎉🎉🎉राकेश सर 👑 किंग ऑफ math', 4, '2026-05-06 08:11:32', 'NEGATIVE', 0.852);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxrPCrwIL-dcWtnV4V4AaABAg', 'A8v_BlhgKgg', '@RishabKumar-w9e5k', 'Explain properly... It is linked to star link', 1, '2026-05-06 18:57:22', 'POSITIVE', 0.9726);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxrtqtHQQogyb7afCh4AaABAg', 'xXVa1aFOhU0', '@Mdbelalfaizi', 'Bhagwa aatankwad ke liye Koi jagah nahin Hai Bharat mein', 2, '2026-05-06 17:12:18', 'NEGATIVE', 0.953);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxuw1G7p5pkK5As_H54AaABAg', 'QFMIcAB_QLI', '@NehaKumari-w9m9h', 'Thank you mam ❤❤❤❤❤🎉🎉', 0, '2026-05-05 05:51:07', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxv4UPBprMlvJ1mbLB4AaABAg', 'QFMIcAB_QLI', '@Study.1-j3w', 'Maam you are best ❤', 0, '2026-05-06 04:00:54', 'POSITIVE', 0.9994);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugxv54nJP3G09zgyAPN4AaABAg', 'zNTE69i8apc', '@wentormenon', 'Bhot badiya 🎉', 0, '2026-05-06 16:04:14', 'NEGATIVE', 0.7703);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxvG0lyFvgEhVY2Bhl4AaABAg', 'eZRTU5zUiZI', '@ThePundits_Official', 'Thanks for attending the event sir ❤', 2, '2026-05-06 12:01:41', 'POSITIVE', 0.9995);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgxvvIVIfvAh3AYYFGt4AaABAg', 'QSNhm_HkNPE', '@akashbansode5812', 'Thanks to Former DCM Ajit Pawar ❤', 5, '2026-05-06 16:43:19', 'POSITIVE', 0.9988);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy-zxnC0m5TIcxbAdJ4AaABAg', 'QSNhm_HkNPE', '@defender8891', 'One tanker and everything blocked 🚫', 0, '2026-05-06 17:38:58', 'NEGATIVE', 0.9993);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy1PVuSmu81RXx_JUV4AaABAg', 'zNTE69i8apc', '@princekumarpryagi8299', 'Apun iich bhagwan hh..', 0, '2026-05-06 20:24:20', 'POSITIVE', 0.6244);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy6l7Ep6k-L3TUOJOx4AaABAg', 'QFMIcAB_QLI', '@vikrantkumar4967', 'Thalapathy❤', 0, '2026-05-05 09:08:52', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy7w3m9OvPHNrs62AV4AaABAg', 'QFMIcAB_QLI', '@All_Gaming_Shorts793', 'Thanks you ma''am', 1, '2026-05-05 03:36:18', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy8ptYPhlfvd4nIwDJ4AaABAg', 'zNTE69i8apc', '@devensingh2787', 'अब दंगे करने वाले पाठ्यक्रम में पढ़ाए जाएंगे बिना टेली प्रोम ter के बोल नहीं सकता', 10, '2026-05-06 16:00:12', 'NEGATIVE', 0.8237);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy9VLC4-7KQXXT-yLp4AaABAg', 'hvBoFojbuXg', '@DUJA-b7e', 'Thanku ma''am 🙏♥🙏', 0, '2026-05-06 06:23:35', 'POSITIVE', 0.9996);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy9feC7hFOsWPNmgM54AaABAg', 'QSNhm_HkNPE', '@iamalien1673', 'Kya hame iski jarurat hai wof wof wof', 107, '2026-05-06 15:36:29', 'NEGATIVE', 0.9538);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyB2q8zGxkL29N9IOt4AaABAg', 'SJ87Q8WOkyM', '@Kish0909', 'Thank You Sir 🙏❤', 0, '2026-05-06 16:06:47', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyBhXcwzGbheYH9PaJ4AaABAg', 'zNTE69i8apc', '@AnishDevvrath', 'नोटबंदी 70% success', 0, '2026-05-06 15:54:50', 'POSITIVE', 0.9993);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyBjC-UjEXucyihotl4AaABAg', 'QSNhm_HkNPE', '@amarjeetsinha8733', 'Great development, the current government doing an excellent work. 👏🏻🇮🇳', 0, '2026-05-06 18:50:21', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyEd2lxlJ_YBzKO2hN4AaABAg', 'QFMIcAB_QLI', '@aanshutiwari-h7i', 'Mam app kha se hai .', 0, '2026-05-05 12:28:22', 'NEGATIVE', 0.8162);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyF7Dr5QsAOpQ9BLKZ4AaABAg', 'TjlDJLFIoeo', '@Ankita_Vishwakarma_0786', 'Thank you so much for fabulous information Guru maa 🙏🙏🙏🎉🎉🎉', 1, '2026-05-06 08:50:11', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyHiAxpZm1lKbUiJ2B4AaABAg', 'lvxdhA7O1Go', '@debasishkashayapbhuyan2389', 'हम assamese को इससे कोयी दिक्कत नहीं है 🙌🏼 জয় আই অসম ✊🏼', 2, '2026-05-06 18:05:59', 'NEGATIVE', 0.903);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyHtTJsrMmpW9nDBPJ4AaABAg', '2T6c77uuqbk', '@RupaliKumari-i6i', 'Thanks mam😊😊', 0, '2026-05-06 08:37:57', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyHuArp1hZ7Fae9IJ94AaABAg', 'zNTE69i8apc', '@aniketbelsare4435', 'And people blame TN for following actor as their leader😑😑😐😐😐', 5, '2026-05-06 15:56:29', 'NEGATIVE', 0.9941);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyImSepREU6rufHAK94AaABAg', '2T6c77uuqbk', '@VikramkumarMishra-p3c', 'मेम 2 बजे वाले histroy की क्लास कब से होगा मेम', 2, '2026-05-06 03:54:29', 'NEGATIVE', 0.9163);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyJ1zGiL_qrH8E_UDt4AaABAg', 'zNTE69i8apc', '@gauravvishwakarma7840', 'Aur ye bhi ek chapter bta de the phenomenon of unanswerability, and to blam history of its own failure.', 0, '2026-05-06 19:18:51', 'NEGATIVE', 0.9968);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyJ6X2Cp7xTHmvO7054AaABAg', 'QSNhm_HkNPE', '@psycho_079', 'Reservation wali engineers or doctor ko hata de to India ka devlopment Speed 4xho jaye ye -40 wale nele engeneer ir doctor gadbad karte hai bas 😅', 30, '2026-05-06 16:24:44', 'NEGATIVE', 0.9856);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyK7XQvQShoJ_Ly_vZ4AaABAg', '2T6c77uuqbk', '@Artist_Aarti', 'Thank you so much ❤', 0, '2026-05-06 18:14:57', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyKsQx695emZNCJyLJ4AaABAg', 'zNTE69i8apc', '@FarukHossain-j5r7f', 'May west Bengal se hu 
Sir phele to freedom of speech nehi tha ab to aur vi nehi hey kuch bolne per marne ka dhamki a jata hey aj ke din hi hamare ghar ke pas 2 insan ko mar Diya Gaya. Pata nehi ham democracy mey rehenge ya nehi', 2, '2026-05-06 16:12:47', 'NEGATIVE', 0.6586);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyKz5wVNsjG_lxb6Ll4AaABAg', 'QFMIcAB_QLI', '@RajanVerma-kb1xn', 'Jai shree ram mam', 1, '2026-05-05 11:53:11', 'POSITIVE', 0.9953);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyLg9OGals34umJX254AaABAg', 'zNTE69i8apc', '@sinoj609', 'Washing powder nirma politics = modhi''s thathwa😂', 4, '2026-05-06 17:18:37', 'NEGATIVE', 0.9643);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyMjpFMHkrTIEEgJaJ4AaABAg', 'QSNhm_HkNPE', '@WINNERRAJ-j9w', 'We need same thing in LOC and POK', 0, '2026-05-06 17:13:07', 'NEGATIVE', 0.9974);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyNSwyjQObM8DihvZ94AaABAg', 'QSNhm_HkNPE', '@nileshtimande683', 'Gandnamaji nahi manege😂', 2, '2026-05-06 17:35:42', 'NEGATIVE', 0.9963);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyPRzXJgc2_mbs-nHR4AaABAg', 'QSNhm_HkNPE', '@TechHackSonuKumar', 'And who is disliking this video from opposition 😂😂', 0, '2026-05-06 19:36:13', 'NEGATIVE', 0.9917);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyQaOc8Hae_K0QI8RV4AaABAg', 'TjlDJLFIoeo', '@HarHarMahadev-p1f', '🕉️ Very nice information Thank you so much Ma''am ji 🙏😊💯🔥', 1, '2026-05-06 07:01:30', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyR-LOjwma1kXJ519t4AaABAg', 'zNTE69i8apc', '@sobhitdeep7711', 'Kya ye bhi pdhya jayega ki rss ka koi yigdaan ngi gha bharat chodo andolan main or sathbhi diya tha britain ka', 1, '2026-05-06 17:09:51', 'NEGATIVE', 0.9844);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyRCvcNdGXg7Cx8l6l4AaABAg', 'AbeTMM-WlT8', '@DheerajKumar-710', '❤❤❤🇮🇳🇮🇳', 1, '2026-05-06 18:04:35', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgySa8SDNd3K1Fe1lgJ4AaABAg', 'zNTE69i8apc', '@bandanchand575', 'my modern ideal....
I like some  crucial steps of him.', 0, '2026-05-06 17:36:53', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyXIK9xIdFJzGwX_s14AaABAg', 'xXVa1aFOhU0', '@sadamhussainbabar2888', 'Election time he False flag or similar “staged operations” are sometimes discussed in political contexts especially when elections are near theoretically it is said that an event can be created or exaggerated to influence public opinion in a certain direction for example to create anger against a group or to shift public sympathy or fear toward a specific side', 0, '2026-05-06 16:40:05', 'NEGATIVE', 0.9934);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyYAoJEu7sohvrdDIR4AaABAg', 'SJ87Q8WOkyM', '@darpan_iitk', 'Awesome revision.', 0, '2026-05-06 17:41:12', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyYtmQvueIACdgAtyB4AaABAg', '2T6c77uuqbk', '@AnuRaj-f1i', 'Sanjay ghandi  राष्ट्रीय उद्यान > महाराष्ट्र,,', 0, '2026-05-06 14:15:52', 'POSITIVE', 0.7841);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugy_OpOvvJ0_Bt0V6fJ4AaABAg', '2T6c77uuqbk', '@RAGHAVGUPTA-f2v', 'Sports current affairs mam', 0, '2026-05-06 07:17:16', 'POSITIVE', 0.9293);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugyb_P9aN_mEq0D5vFB4AaABAg', 'xXVa1aFOhU0', '@vaneetkumarthakur8511', 'Jab sarkar hi gadhon ki bani hui hai to police ghanta security karegi.', 0, '2026-05-06 19:31:37', 'NEGATIVE', 0.7612);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugybelp5gIQNJzA8-XZ4AaABAg', '2T6c77uuqbk', '@MadhuYadav-lj1ex', 'Thank you ma''am 🙏', 2, '2026-05-06 03:44:48', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgycbXhPNNCBXVkzCLZ4AaABAg', 'SJ87Q8WOkyM', '@Haryana-India', 'Kavyamimasa & Karpuramanjari by Rajasekhara', 0, '2026-05-06 18:53:06', 'POSITIVE', 0.9847);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugyci2PCdN1g-RJy72V4AaABAg', '2T6c77uuqbk', '@AnuRaj-f1i', '22 april ko 2026 rewards milta  h', 2, '2026-05-06 13:50:15', 'POSITIVE', 0.9989);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyfH7HjeasfqFxFP2F4AaABAg', 'A8v_BlhgKgg', '@rubendebbarma5040', 'Northeast rural area pe sudhar kaise huga jab normal jio recharge hi itna mehenga koi sense hai?', 2, '2026-05-06 17:23:59', 'NEGATIVE', 0.9933);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgygOh9SR6jYPv9Pfnh4AaABAg', 'wVFPx1m4rQ0', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/ARGLIVE

Call Us for UPSC Counselling-  9240231046 / 76-4000-3000

To download the PDF: https://studyiq.u9ilnk.me/d/GENp0BzUnJ

Use code ''VASULIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ARGLIVE', 0, '2026-05-06 15:00:28', 'NEGATIVE', 0.9766);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgygWcNQog9wc9b-ZBB4AaABAg', 'QFMIcAB_QLI', '@SHIBUU4145', 'Super class ma''am ❤❤❤ thank you so much ma''am ❤', 1, '2026-05-05 03:24:05', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugyh1lu-YmSyBfmMIYZ4AaABAg', 'QFMIcAB_QLI', '@Avneesh-g5k', 'Radhe Radhe mam ji', 1, '2026-05-05 04:29:39', 'POSITIVE', 0.7346);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugyh53TBRbn-Dlsrkfd4AaABAg', 'zNTE69i8apc', '@GOOOOWORLD', 'Yes hame china aur russia k raste pe hi nikal lena chahiye', 0, '2026-05-06 19:11:21', 'POSITIVE', 0.9064);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyiXvJ3upOkCpDksw14AaABAg', 'eZRTU5zUiZI', '@TitliAsoLife', 'Sir mai 1 saal sai preperation kr rhe ssc CGL ka', 1, '2026-05-06 08:20:26', 'NEGATIVE', 0.9928);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyitIFjz71Hvu4Cjjd4AaABAg', 'xXVa1aFOhU0', '@rowhitsharma8220', 'subkuch punjab police hi karegi..for kya Centre agencies soyengi ?', 7, '2026-05-06 17:19:07', 'NEGATIVE', 0.99);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyjUqFc1cOZ0gmk9Ud4AaABAg', 'zNTE69i8apc', '@AdityaGupta-j2q', 'Bihar mai hum issko fekuloozi kehte hai😂', 0, '2026-05-06 19:19:46', 'NEGATIVE', 0.989);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgykqvVbr8_nFCrfuAJ4AaABAg', 'xXVa1aFOhU0', '@aur2864', 'Free Khalistan 😮😮😮', 2, '2026-05-06 18:16:31', 'POSITIVE', 0.9909);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgylMvLFRCL3FkoKyNl4AaABAg', 'xXVa1aFOhU0', '@akshatsaxena2135', 'Remove AAP from Punjab!!!', 3, '2026-05-06 18:11:17', 'NEGATIVE', 0.9981);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugym_AtCNNRTiYtpEMZ4AaABAg', 'xXVa1aFOhU0', '@aur2864', 'Free Khalistan 😮😮😮', 0, '2026-05-06 18:16:46', 'POSITIVE', 0.9909);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyoQBpYiKBoLqq_ixB4AaABAg', 'A8v_BlhgKgg', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/ARGLIVE

Call Us for UPSC Counselling-  9240231046 / 76-4000-3000

To download the PDF: https://studyiq.u9ilnk.me/d/GENp0BzUnJ

Use code ''VASULIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/ARGLIVE', 1, '2026-05-06 16:50:33', 'NEGATIVE', 0.9766);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyuRjnQP53r2-oCJNt4AaABAg', 'QSNhm_HkNPE', '@MrTravelleRNK', 'Just think about this-
1. 7000 crore to make this engineering marvel
2. 900000 crore to free fees.', 1, '2026-05-06 16:47:35', 'NEGATIVE', 0.7246);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyubS1XJuTst8aSzKd4AaABAg', 'zNTE69i8apc', '@DontTrustEveryone-r5s', 'Learning politics is very important, best politicians must be remembered and read. Burnol users existed in every yugas.', 0, '2026-05-06 20:24:54', 'POSITIVE', 0.7362);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyvF0_a2FRr2NKYO3h4AaABAg', 'QFMIcAB_QLI', '@RishuPandit-l1m', 'Telegram pe current affairs ka pdf mil jayega???', 0, '2026-05-05 06:44:20', 'NEGATIVE', 0.9963);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyvoMnbRn-jyxfIQ7J4AaABAg', 'lvxdhA7O1Go', '@kpramodsingha1859', 'We are happy with it.. from assam', 5, '2026-05-06 17:40:55', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugyw-AhIou4qwml7gmR4AaABAg', 'QFMIcAB_QLI', '@itsjeevapal', '❤❤❤❤❤', 0, '2026-05-05 10:34:39', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugywf6NXbkEkNVZCRIZ4AaABAg', 'QSNhm_HkNPE', '@psycho_079', 'Reservation walo engeneer ne pul banya tha bihar me vo ger gya isliye reservation hatna chahiye', 5, '2026-05-06 17:00:30', 'NEGATIVE', 0.9927);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyxqKchlffdqT296-J4AaABAg', 'zNTE69i8apc', '@mayamurmu5281', 'जो प्रधानमंत्री तीन बार प्रधानमंत्री होने के बाद भी एक बार भी प्रेस कॉन्फ्रेंस नहीं कर सका उसके बारे में पढ़कर कौन सी शिक्षा हासिल करेंगे अभी के विद्यार्थी? न जाने क्यों लोग शिक्षा के लिए मरे जा रहे हैं बिना शिक्षित हुए ही नेता शिक्षितों के ऊपर राज कर रहे हैं इस बात की पढ़ाई होने वाली है कैसे पढ़ाई को छोड़ देना है और कैसे लोगों की भावनाओं से खेल कर राजनीति करनी है........... हम जरूर लड़ेंगे ऐसी शिक्षा हमें नहीं चाहिए।', 27, '2026-05-06 16:20:05', 'NEGATIVE', 0.9005);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgyylQtJuHdz0T0ppi94AaABAg', '2T6c77uuqbk', '@NehaKumari-w9m9h', 'Thank you mam ❤❤❤', 0, '2026-05-06 05:37:39', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz07b6Dr-loMAHMnAl4AaABAg', '2T6c77uuqbk', '@BabitaKumari-v2u8j', 'Mama history ka class kab  hoga', 0, '2026-05-06 06:04:17', 'NEGATIVE', 0.9749);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz0uDSMuTCgrfrROrF4AaABAg', 'QFMIcAB_QLI', '@HarHarMahadev-p1f', '🕉️ Very nice season Thank you so much Ma''am ji 🙏🙏😊💯🔥', 1, '2026-05-05 03:25:16', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz3v_vd59XWV1ogYt14AaABAg', 'QFMIcAB_QLI', '@zalahitesh5832', 'I am from Gujarat ❤', 0, '2026-05-05 08:48:30', 'POSITIVE', 0.9777);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz3z7vfQ9aidMFORUR4AaABAg', 'xXVa1aFOhU0', '@adityamahajan1425', 'i am panjabi first blast is only   5 km away from my home', 1, '2026-05-06 19:42:44', 'NEGATIVE', 0.8138);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz3zVff9rBQHe6_PBZ4AaABAg', 'QSNhm_HkNPE', '@tejaspatil6755', 'जय महाराष्ट्र 🚩🚩🚩🚩🚩', 1, '2026-05-06 17:11:43', 'NEGATIVE', 0.826);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz4CMIL5hVXv1r2vkl4AaABAg', 'QSNhm_HkNPE', '@psycho_079', 'Chamche nhi mane ge 😂', 33, '2026-05-06 15:55:48', 'NEGATIVE', 0.7107);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz6E1xFPRp4AKQnC8l4AaABAg', 'QSNhm_HkNPE', '@Unapologetichindu24', 'Kya hume iss world record ki jarurat hai??', 0, '2026-05-06 18:42:34', 'NEGATIVE', 0.9812);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz6sPEdZSkeY3M5lCZ4AaABAg', 'SJ87Q8WOkyM', '@komalsaini6299', 'Thanku sir', 0, '2026-05-06 19:47:10', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz7R6stdohl2CRIXsV4AaABAg', 'xXVa1aFOhU0', '@sanjitthounaojamsingh787', 'Sir what about manipur eat and wach', 1, '2026-05-06 19:33:01', 'POSITIVE', 0.6571);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz84L-22oCeyzz9XqB4AaABAg', 'QSNhm_HkNPE', '@Indianscanvas', 'Isme bi space technology use hui hogi😂😂', 2, '2026-05-06 15:40:57', 'NEGATIVE', 0.6774);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz8PXvjpXKeY-I7Vut4AaABAg', 'QSNhm_HkNPE', '@akshaykumar-qs4ks', 'Wow Nice 💯', 0, '2026-05-06 18:05:30', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz8jtNxjV8XCT9YtGJ4AaABAg', 'zNTE69i8apc', '@AshishKumar-dg8vy', 'Absolutely right decision
RSS is the pride of our country', 9, '2026-05-06 16:21:08', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz9lzhFKkxp8TRgb5d4AaABAg', 'QSNhm_HkNPE', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses: https://studyiq.u9ilnk.me/d/ANKITLIVE

Call Us for UPSC Counselling- 09240023293 / 76-4000-3000

Use code ''ANKITLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch  : https://studyiq.u9ilnk.me/d/ANKITLIVE', 11, '2026-05-06 11:39:59', 'NEGATIVE', 0.9691);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzALFNRezzuVXnyrZJ4AaABAg', '2T6c77uuqbk', '@Jyotikumariburnwal2', 'Thanku very much mam😊😊🙏🙏aap bahut acchse se samjha ke padhati h', 3, '2026-05-06 03:30:17', 'POSITIVE', 0.9942);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzANEvsTQQZw_vaif14AaABAg', 'zNTE69i8apc', '@STVision1', 'Epistein file ka kya hoga... Aise bhrust neta ko ideal manenge toh iss desh ka kya hoga...', 1, '2026-05-06 17:09:09', 'NEGATIVE', 0.9912);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzBW745i_1p28JtXy14AaABAg', '2T6c77uuqbk', '@AnuRaj-f1i', 'लॉन्चिंग of uber cup >  dakhin koriya', 0, '2026-05-06 14:12:43', 'POSITIVE', 0.9181);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzCNNpEqq9gT8KaWbp4AaABAg', 'zNTE69i8apc', '@ashishranjan5109', 'अब ncert change hoga 100 percent ane bale bachhe ke liye', 0, '2026-05-06 17:46:32', 'NEGATIVE', 0.9715);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzDO8VGVb_pQ7FEduF4AaABAg', 'eZRTU5zUiZI', '@viratyadav-xn9rg', 'Rakesh Sir Respect button 🔘✅', 8, '2026-05-06 08:04:19', 'POSITIVE', 0.9884);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzFjBu7FxuOeqm7d7t4AaABAg', 'lvxdhA7O1Go', '@amamgain753', 'National security first', 8, '2026-05-06 16:11:44', 'POSITIVE', 0.9984);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzHc6eJK2nB9UxHuDd4AaABAg', 'xXVa1aFOhU0', '@aur2864', 'Free Khalistan 😮😮😮', 2, '2026-05-06 18:16:26', 'POSITIVE', 0.9909);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzHcKtwpJo2DNYt-uh4AaABAg', 'hvBoFojbuXg', '@radha001-11q', 'Thank you mam❤', 0, '2026-05-05 06:02:56', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzIv3iTID0FXRN9mOB4AaABAg', '2T6c77uuqbk', '@SanjanaButhyall', '❤❤', 0, '2026-05-06 03:18:56', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzJYz0RJqg5Z9SFbUZ4AaABAg', 'QSNhm_HkNPE', '@vishalfulsundar3588', 'It''s formar CM udhav thakarey''s dream project', 0, '2026-05-06 16:46:22', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzKNu7Jyvwbob-lMEB4AaABAg', 'lvxdhA7O1Go', '@realtrue369', 'He is mama....', 3, '2026-05-06 17:40:09', 'POSITIVE', 0.9308);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzM15NHFe8h3jxE4xt4AaABAg', 'QSNhm_HkNPE', '@AshishSingh-ex4uy', 'Well my ex deserves this record in true sense 💀', 14, '2026-05-06 16:41:53', 'POSITIVE', 0.9974);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzMygFBeeh0D9QnQzF4AaABAg', 'xXVa1aFOhU0', '@rowhitsharma8220', 'Border terrorism hai toh thoda centre ko bhi lelo.... bas state ko hi dhote rahoge', 7, '2026-05-06 17:20:20', 'NEGATIVE', 0.9824);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzQYLXE5iXHt3W-t6J4AaABAg', 'lvxdhA7O1Go', '@Verstoppen69', 'Needed in every state', 1, '2026-05-06 19:01:44', 'POSITIVE', 0.9965);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzRIseN0yreLqJ6re94AaABAg', 'TjlDJLFIoeo', '@aspirantkavitakushwaha9370', 'thanks ma''am ji wonderful revision 👍❣️🥰', 0, '2026-05-06 18:06:45', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzSpg37fOLZZI0AO3J4AaABAg', 'TjlDJLFIoeo', '@AKANKSHAT-4J', 'Thankyou mam ❤', 1, '2026-05-06 10:11:22', 'POSITIVE', 0.999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzVKu3GWIwHCNgncSZ4AaABAg', 'QFMIcAB_QLI', '@SanjibBurnwal', 'Jay shree Ram mam 😊', 0, '2026-05-05 15:40:22', 'POSITIVE', 0.5273);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzVd_RkgBejxgigzhl4AaABAg', 't0o4Ax8wWMw', '@Official_paras_sharma', 'Sir kab sa suru ha ya bach', 0, '2026-05-06 08:18:20', 'POSITIVE', 0.967);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzWunuMWwxkFZ2OtPZ4AaABAg', '2T6c77uuqbk', '@AnuRaj-f1i', 'लॉन्चिंग of राष्ट्रीय सम्मेलन  > from  delhi', 2, '2026-05-06 13:52:42', 'POSITIVE', 0.8924);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzYZkgPeyMlYlT-Nmp4AaABAg', 'hvBoFojbuXg', '@PritiSaini-b3g', 'very nice news 🗞️🗞️...
thank youuuuuuu so much ma''am 🙏😍🥰💗🫶💗💗💯', 0, '2026-05-05 06:20:01', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzYrQkZlR0W8S52nfN4AaABAg', 'QFMIcAB_QLI', '@NituKumariu', 'Good morning', 0, '2026-05-05 04:03:58', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugz_CMAe0Otvjp61qRJ4AaABAg', '2T6c77uuqbk', '@ZishuTv506', 'Ma''am last 6 month kra dijiye education government schemes Book author and award science and technology sports current  affairs who is who', 0, '2026-05-06 12:00:45', 'POSITIVE', 0.9742);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzc9PCgye1HkJXRLTd4AaABAg', 'TjlDJLFIoeo', '@SharwanpanditSharwanpandit', 'Thank you so much ma''am', 0, '2026-05-06 16:14:12', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzcTcaj-eGmkFXIu6l4AaABAg', '21JPw29GxxQ', '@Vidyanand_yadav.07', '❤', 0, '2026-05-05 13:07:18', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzfG1uGt8I_JHqukr14AaABAg', 'QFMIcAB_QLI', '@SmritiVerma-n3f', 'I am form Bihar ❤', 4, '2026-05-05 07:52:05', 'POSITIVE', 0.7692);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzfV2UM-ZR27KLX_rh4AaABAg', 'QSNhm_HkNPE', '@Deepeshkoundal', 'Bihar or baki jgha b bridge girne k world record ban rhe h ki kon pehle girta h banne k bad ya banne k pehle 😂', 4, '2026-05-06 16:10:28', 'NEGATIVE', 0.9927);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzfsholFXdNBu_JXoV4AaABAg', '21JPw29GxxQ', '@shagunkushwaha12', '❤❤❤', 0, '2026-05-06 03:42:20', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzgJMxzyJD3bm2aqyB4AaABAg', 'QSNhm_HkNPE', '@nanumix3167', 'Sir wo manipur 😅', 1, '2026-05-06 16:27:27', 'NEGATIVE', 0.9666);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzgbiMkNr9eWKYSEgB4AaABAg', 'QSNhm_HkNPE', '@omkarsonawane4917', 'Jay Maharashtra 🚩', 1, '2026-05-06 17:06:12', 'NEGATIVE', 0.814);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzgmcpVzOVTpNsL_cd4AaABAg', 'AbeTMM-WlT8', '@StudyIQEducationLtd', 'Clear UPSC with StudyIQ’s Courses : https://studyiq.u9ilnk.me/d/VarunJauhari

Call Us for UPSC Counselling- 76-4000-3000

Use code ''VJLIVE'' to get Highest Discount

UPSC IAS Live GS P2I Foundation 2027 Pratigya May Batch 
Hurry Enroll Now : https://studyiq.u9ilnk.me/d/VarunJauhari', 0, '2026-05-06 13:07:58', 'NEGATIVE', 0.9642);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzgqqJpX-gXKa_oRo54AaABAg', 'eZRTU5zUiZI', '@Dibbanjalendra', 'Abhinay sir se milna h ❤❤', 0, '2026-05-06 12:14:49', 'POSITIVE', 0.9736);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzhPZjO7rvk7rp-97Z4AaABAg', 'hvBoFojbuXg', '@shagunkushwaha12', '❤❤❤', 2, '2026-05-05 06:19:26', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzhgTwrPeQh8552dbl4AaABAg', 'A8v_BlhgKgg', '@lovetosanatani', 'Mere bacho ki kya galati hai', 0, '2026-05-06 16:51:52', 'NEGATIVE', 0.852);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgziUdB-zyjDpXWEHyt4AaABAg', 'QFMIcAB_QLI', '@SunitaDevi-q8y9s', 'Hello maim ap bhut acha padhti ho kya ye ssc stenographer ke liye bhi h', 0, '2026-05-05 06:45:10', 'POSITIVE', 0.6817);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzifB4i3bLAjNVNowB4AaABAg', 't0o4Ax8wWMw', '@Virat_lovers_cricketer', '❤❤❤❤❤❤❤❤', 0, '2026-05-06 06:06:31', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzipfy6us1K4dVsvA14AaABAg', 'xXVa1aFOhU0', '@aur2864', 'Free Khalistan 😮😮😮', 1, '2026-05-06 18:16:36', 'POSITIVE', 0.9909);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzlzLSaNOf-It5AKTN4AaABAg', 'QSNhm_HkNPE', '@naturelover6920', 'Rasta mai bhi space technology use hua uske liye koi award hai kya 😂', 0, '2026-05-06 18:20:35', 'NEGATIVE', 0.943);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzmL0hxyjIqM0XYStJ4AaABAg', 'zNTE69i8apc', '@Rosha192', 'Hahah😆😆😆 sapana sapana', 2, '2026-05-06 16:26:00', 'NEGATIVE', 0.9928);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzoGgXwJ9N7YPJQI6h4AaABAg', 'QSNhm_HkNPE', '@akipro2707', 'Someone from germany : Hum iss world record ka kya karenge 😢😂', 389, '2026-05-06 15:42:27', 'NEGATIVE', 0.9598);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzoZqSu6ycN7XM17bJ4AaABAg', 'QFMIcAB_QLI', '@sumanKumar-i3q1o', 'Doawlond nh ho rha hai', 0, '2026-05-05 13:36:10', 'NEGATIVE', 0.973);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzp-F6TGsSohRENZp94AaABAg', 'QFMIcAB_QLI', '@LearnAndMotivation', 'Thanks you ❤', 1, '2026-05-06 11:56:04', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzqdklDXgm7AgfDXWR4AaABAg', 'hvBoFojbuXg', '@nishukashyap8079', '😊🎉🎉', 0, '2026-05-05 14:40:41', 'NEGATIVE', 0.6971);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzrveIXPbUpb4pb0KR4AaABAg', 'QFMIcAB_QLI', '@VISHALKUMAR-sz4jv', 'Thanks mam', 0, '2026-05-05 11:44:43', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzsLudgTakhyOu1ssB4AaABAg', 'A8v_BlhgKgg', '@sridharsadagopan6103', 'You missed important points. Howmany satellite will be required. What investment. How long will it last. How cheap or expensive will it be to the end user. Can it upgrade to the 6th generation. Can it be used with the existing device or will a new device be required. Already jio is changing ecessively. More or less monopoly. Unaffordable to poor people.', 1, '2026-05-06 19:18:14', 'NEGATIVE', 0.9996);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzs_yZ8lH7S91g_S-J4AaABAg', 'zNTE69i8apc', '@chunnibabu108', 'हिंदू धर्म जैन सिख बौद्ध धर्म के असली आचार्यों के शिक्षा दीजिए l 🎉', 19, '2026-05-06 15:46:52', 'NEGATIVE', 0.6163);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzu2ScsIXM68RJ31zl4AaABAg', 'RmKDUK0mIUM', '@RakeshsoniSoni-g3t6d', 'Best faulty ❤❤', 0, '2026-05-06 15:09:06', 'NEGATIVE', 0.9982);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzvoUNsLPI14xRCtmB4AaABAg', 'hvBoFojbuXg', '@MdDilshad-x8x2w', 'Thank you ma''am 😢😮🎉🎉🎉🎉❤😂😂', 0, '2026-05-06 03:45:08', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzvsV3-dM2_x4tsyVt4AaABAg', 'QFMIcAB_QLI', '@promodsahni851', 'Very nice session ❤', 0, '2026-05-05 08:18:55', 'POSITIVE', 0.9999);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzw8K8kaTGnUQ3JAiZ4AaABAg', 'xohSmqLf4_U', '@Study.1-j3w', 'Thanku sir 🤩', 0, '2026-05-06 04:00:21', 'POSITIVE', 0.9997);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzx1jTATYHcM_BC5sx4AaABAg', 'QFMIcAB_QLI', '@Silent_lover_10k', 'I am from india😂', 1, '2026-05-05 04:34:39', 'POSITIVE', 0.8059);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzxe07j_XRJZ2c-Pll4AaABAg', 'lvxdhA7O1Go', '@Programming_with_Dr_Deepak', 'Democracy is number game. You have to play the game.  Why Hindus cannot vote as a unified votebank and these strategies have to be adopted. Are you in support of demographic change which is happening anyways. Secularism and ideals can become death beds for Hindus. It has happened in past. Prithviraj Chauhan giving 16 lifelines is a good example.', 3, '2026-05-06 17:40:27', 'POSITIVE', 0.976);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzxhaQrx-i5ET7rjcZ4AaABAg', 'hvBoFojbuXg', '@AKANKSHAT-4J', 'Thankyou mam', 0, '2026-05-05 10:59:35', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzxzN7mMOwITFr3SO54AaABAg', 'zNTE69i8apc', '@learninghub1896', 'It''s very good to get back to our roots❤❤❤', 6, '2026-05-06 16:02:53', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzyp1YIQQaREn_kkFN4AaABAg', '2T6c77uuqbk', '@Yadavshreyaskumar', 'Nice session ma''am ❤❤', 2, '2026-05-06 03:50:15', 'POSITIVE', 0.9998);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('Ugzyz4P0tbm65NE6LX94AaABAg', 'xXVa1aFOhU0', '@jojogonjalves4137', 'Now imagine, if these khalistani punjabis move to other states of India like delhi Or mumbai.', 1, '2026-05-06 18:26:08', 'NEGATIVE', 0.9862);
INSERT INTO comments (comment_id, video_id, author_name, comment_text, like_count, published_at, sentiment_label, sentiment_score) VALUES ('UgzzTHl4apJOX8albeR4AaABAg', 'zNTE69i8apc', '@PriyanshuSingh-24', 'हम बुक्स में खाली विदेशी राजनीतिज्ञो और समाजशास्त्रीयो के बारे में पढ़ पढ़ के सोचते थे इनमें से विदेशी क्यों चलो अच्छी बात है एक भारतीय व्यक्ति के भी नाम जुड़े ❤
लेकिन आलोचनात्मक प्रकाश डालनी भी चाहिए😢 शिक्षा न्यूट्रल होना चाहिए।', 4, '2026-05-06 16:39:15', 'NEGATIVE', 0.8776);
