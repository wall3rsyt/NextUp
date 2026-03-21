ALTER TABLE `users`
  ADD IF NOT EXISTS `gmtPhoto` longtext DEFAULT NULL,
  ADD IF NOT EXISTS `gmtWorkerPhoto` longtext DEFAULT NULL,
  ADD IF NOT EXISTS `jobJoined` varchar(40) DEFAULT NULL,
  ADD IF NOT EXISTS `dutyTime` int(11) NOT NULL DEFAULT 0,
  ADD IF NOT EXISTS `badge` int(11) DEFAULT NULL,
  ADD IF NOT EXISTS `lastActive` varchar(46) DEFAULT NULL;

ALTER TABLE `user_licenses`
  ADD IF NOT EXISTS `name` varchar(30) DEFAULT NULL;

ALTER TABLE `owned_vehicles`
  ADD IF NOT EXISTS `job` varchar(30) DEFAULT NULL,
  ADD IF NOT EXISTS `wheelchair` int(1) DEFAULT '0',
  ADD IF NOT EXISTS `wheelchairTime` bigint(25) DEFAULT 0;

CREATE TABLE `gmt_announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `creator` varchar(46) NOT NULL,
  `time` bigint(25) NOT NULL,
  `job` varchar(20) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0
);

CREATE TABLE `gmt_citizens_notes` (
  `id` int(11) NOT NULL,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL
);

CREATE TABLE `gmt_citizens_procedures` (
  `id` int(11) NOT NULL,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL
);

CREATE TABLE `gmt_citizens_allergies` (
  `id` int(11) NOT NULL,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL
);

CREATE TABLE `gmt_licenses` (
  `id` int(11) NOT NULL,
  `owner` varchar(46) NOT NULL,
  `type` varchar(20) NOT NULL,
  `label` varchar(25) NOT NULL
);

CREATE TABLE `gmt_documents` (
  `id` int(11) NOT NULL,
  `owner` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `type` varchar(40) NOT NULL,
  `label` varchar(120) NOT NULL,
  `time` bigint(25) NOT NULL,
  `job` varchar(30) NOT NULL,
  `expireTime` bigint(25) NOT NULL
);

CREATE TABLE `gmt_workers_notes` (
  `id` int(11) NOT NULL,
  `creator` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `time` bigint(25) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0
);


ALTER TABLE `gmt_announcements`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gmt_citizens_notes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gmt_citizens_procedures`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gmt_citizens_allergies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gmt_licenses`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gmt_workers_notes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gmt_documents`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gmt_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `gmt_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `gmt_citizens_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `gmt_citizens_procedures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `gmt_citizens_allergies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `gmt_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `gmt_workers_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;