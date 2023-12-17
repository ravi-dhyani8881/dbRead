CREATE TABLE `Product` (
  `id` int PRIMARY KEY,
  `name` string,
  `descrption` string,
  `merchant_id` int,
  `country_code` int,
  `added_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `Reviews` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `Description` string,
  `ratting` int,
  `userId` int,
  `added_date` datetime
);

CREATE TABLE `Like` (
  `id` int PRIMARY KEY,
  `review_id` int,
  `userId` int,
  `added_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `Dislike` (
  `id` int PRIMARY KEY,
  `review_id` int,
  `userId` int,
  `added_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `Helpfull` (
  `id` int PRIMARY KEY,
  `review_id` int,
  `userId` int,
  `added_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `Reply` (
  `id` int PRIMARY KEY,
  `review_id` int,
  `userId` int,
  `added_date` datetime
);

CREATE TABLE `ReplyOnReply` (
  `id` int PRIMARY KEY,
  `replyId` int,
  `userId` int,
  `added_date` datetime
);

CREATE TABLE `User` (
  `id` int PRIMARY KEY,
  `name` string,
  `last_name` string,
  `age` int,
  `added_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `settings` (
  `usertype` text,
  `userid` text,
  `settings` jsonb,
  PRIMARY KEY (`usertype`, `userid`)
);

CREATE TABLE `auditlog` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `events` (
  `entitytype` text,
  `entityid` text,
  `created` timestamptz,
  `isopencontribution` boolean,
  `isowncontribution` boolean,
  `usercorporateid` text,
  `action` text,
  `userusername` text,
  `userid` text,
  `usercorporateusername` text,
  `organizationname` text,
  `organizationid` text,
  `repositoryname` text,
  `repositoryid` text,
  `inserted` timestamptz,
  `updated` timestamptz,
  `checked` timestamptz,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `approvals` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `repositorymetadata` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `repositorycache` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `organizationsettings` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `organizationannotations` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `usersettings` (
  `entitytype` text,
  `entityid` text,
  `contributionshareoptin` boolean,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `repositorycollaboratorcache` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `organizationmembercache` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `teamcache` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `teammembercache` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `repositoryteamcache` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `links` (
  `linkid` text,
  `thirdpartytype` text NOT NULL,
  `thirdpartyid` text NOT NULL,
  `thirdpartyusername` text,
  `thirdpartyavatar` text,
  `corporateid` text,
  `corporateusername` text,
  `corporatename` text,
  `corporatemail` text,
  `corporatealias` text,
  `serviceaccount` boolean DEFAULT false,
  `serviceaccountmail` text,
  PRIMARY KEY (`thirdpartytype`, `thirdpartyid`)
);

CREATE TABLE `voting` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  PRIMARY KEY (`entitytype`, `entityid`)
);

CREATE TABLE `repositories` (
  `entitytype` text,
  `entityid` text,
  `metadata` jsonb,
  `repositoryid` bigint,
  `organizationid` bigint,
  `cached` timestamptz,
  `name` text,
  `organizationlogin` text,
  `fullname` text,
  `private` boolean,
  `visibility` text,
  `fork` boolean,
  `archived` boolean,
  `disabled` boolean,
  `pushedat` timestamptz,
  `createdat` timestamptz,
  `updatedat` timestamptz,
  `description` text,
  `homepage` text,
  `language` text,
  `forkscount` integer,
  `stargazerscount` integer,
  `watcherscount` integer,
  `size` bigint,
  `defaultbranch` text,
  `openissuescount` integer,
  `hasissues` boolean,
  `hasprojects` boolean,
  `haswiki` boolean,
  `haspages` boolean,
  `hasdownloads` boolean,
  `subscriberscount` integer,
  `networkcount` integer,
  `license` text,
  `parentid` bigint,
  `parentname` text,
  `parentorganizationname` text,
  `parentorganizationid` bigint,
  PRIMARY KEY (`entitytype`, `entityid`)
);

ALTER TABLE `Product` ADD FOREIGN KEY (`id`) REFERENCES `Reviews` (`product_id`);

ALTER TABLE `Reviews` ADD FOREIGN KEY (`id`) REFERENCES `Like` (`review_id`);

ALTER TABLE `Reviews` ADD FOREIGN KEY (`id`) REFERENCES `Dislike` (`review_id`);

ALTER TABLE `Reviews` ADD FOREIGN KEY (`id`) REFERENCES `Helpfull` (`review_id`);

ALTER TABLE `Reviews` ADD FOREIGN KEY (`id`) REFERENCES `Reply` (`review_id`);

ALTER TABLE `Reply` ADD FOREIGN KEY (`id`) REFERENCES `ReplyOnReply` (`replyId`);

ALTER TABLE `User` ADD FOREIGN KEY (`id`) REFERENCES `Reviews` (`userId`);

ALTER TABLE `User` ADD FOREIGN KEY (`id`) REFERENCES `Like` (`userId`);

ALTER TABLE `User` ADD FOREIGN KEY (`id`) REFERENCES `Dislike` (`userId`);

ALTER TABLE `User` ADD FOREIGN KEY (`id`) REFERENCES `Helpfull` (`userId`);

ALTER TABLE `User` ADD FOREIGN KEY (`id`) REFERENCES `Reply` (`userId`);

ALTER TABLE `User` ADD FOREIGN KEY (`id`) REFERENCES `ReplyOnReply` (`userId`);
