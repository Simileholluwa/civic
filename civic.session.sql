-- INSERT INTO serverpod_user_info (
--   "id", "userIdentifier", "userName", "fullName", "email", "created", "imageUrl", "scopeNames", "blocked"
-- )
-- VALUES 
-- (10, 'adebayo.silas@example.com', 'AdebayoSilas', '', 'adebayo.silas@example.com', '2025-07-15T11:20:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/10-10.jpg', '[]', false),
-- (11, 'grace.okon@example.com', 'GraceOkon', '', 'grace.okon@example.com', '2025-07-15T12:00:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/11-11.jpg', '[]', false),
-- (12, 'emeka.nwachukwu@example.com', 'EmekaNwa', '', 'emeka.nwachukwu@example.com', '2025-07-15T13:45:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/12-12.jpg', '[]', false),
-- (13, 'amina.garba@example.com', 'AminaGarba', '', 'amina.garba@example.com', '2025-07-15T14:30:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/13-13.jpg', '[]', false),
-- (14, 'michael.udo@example.com', 'MichaelUdo', '', 'michael.udo@example.com', '2025-07-15T15:10:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/14-14.jpg', '[]', false),
-- (15, 'blessing.ogundipe@example.com', 'BlessingO', '', 'blessing.ogundipe@example.com', '2025-07-15T15:50:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/15-15.jpg', '[]', false),
-- (16, 'raphael.onuoha@example.com', 'RaphaelO', '', 'raphael.onuoha@example.com', '2025-07-15T16:20:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/16-16.jpg', '[]', false),
-- (17, 'hannah.yusuf@example.com', 'HannahY', '', 'hannah.yusuf@example.com', '2025-07-15T17:00:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/17-17.jpg', '[]', false),
-- (18, 'ifeanyi.okafor@example.com', 'IfeanyiO', '', 'ifeanyi.okafor@example.com', '2025-07-15T18:00:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/18-18.jpg', '[]', false),
-- (19, 'patience.ike@example.com', 'PatienceIke', '', 'patience.ike@example.com', '2025-07-15T19:10:00Z', 'https://civic-development.s3.eu-north-1.amazonaws.com/serverpod/user_images/19-19.jpg', '[]', false);



INSERT INTO user_record (
  id, bio, nin, "userInfoId", "firstName", "lastName", "middleName", email,
  "followersCount", "followingCount", "createdAt", "politicalStatus", "credibilityScore"
)
VALUES 
(10, 'Local government reform advocate', '67890123456', 10, 'Adebayo', 'Silas', 'Tope', 'adebayo.silas@example.com', 1, 1, '2025-07-15T11:20:00Z', 1, 3.5),
(11, 'Women in politics champion', '78901234567', 11, 'Grace', 'Okon', 'Ita', 'grace.okon@example.com', 3, 2, '2025-07-15T12:00:00Z', 0, 4.3),
(12, 'Infrastructure policy advisor', '89012345678', 12, 'Emeka', 'Nwachukwu', 'Chukwuemeka', 'emeka.nwachukwu@example.com', 2, 1, '2025-07-15T13:45:00Z', 2, 3.9),
(13, 'Healthcare accessibility advocate', '90123456789', 13, 'Amina', 'Garba', 'Musa', 'amina.garba@example.com', 4, 3, '2025-07-15T14:30:00Z', 1, 4.6),
(14, 'Public sector innovation strategist', '01234567890', 14, 'Michael', 'Udo', 'Ekene', 'michael.udo@example.com', 2, 2, '2025-07-15T15:10:00Z', 2, 3.3),
(15, 'Youth political engagement officer', '12345098765', 15, 'Blessing', 'Ogundipe', 'Tolulope', 'blessing.ogundipe@example.com', 5, 4, '2025-07-15T15:50:00Z', 0, 4.7),
(16, 'Election transparency specialist', '23456109876', 16, 'Raphael', 'Onuoha', 'Ikenna', 'raphael.onuoha@example.com', 3, 3, '2025-07-15T16:20:00Z', 2, 4.4),
(17, 'Social equity campaigner', '34567210987', 17, 'Hannah', 'Yusuf', 'Zainab', 'hannah.yusuf@example.com', 2, 1, '2025-07-15T17:00:00Z', 1, 3.6),
(18, 'Legislative process educator', '45678321098', 18, 'Ifeanyi', 'Okafor', 'Nnamdi', 'ifeanyi.okafor@example.com', 1, 2, '2025-07-15T18:00:00Z', 0, 3.8),
(19, 'Public accountability auditor', '56789432109', 19, 'Patience', 'Ike', 'Amarachi', 'patience.ike@example.com', 3, 3, '2025-07-15T19:10:00Z', 2, 4.2);
