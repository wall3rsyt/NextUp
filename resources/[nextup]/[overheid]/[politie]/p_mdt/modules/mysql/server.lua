local function tableExists(tableName)
    local result = MySQL.Sync.fetchScalar("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = ?", { tableName })
    return result > 0
end

CreateThread(function()
    lib.print.info('Initializing Auto-Install of MDT Database Tables...')
    Wait(1000)
    while not MySQL or not MySQL.ready do
        Citizen.Wait(100)
    end

    if not tableExists('p_mdt_applications') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_applications` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `applicant` longtext NOT NULL,
                `questions` longtext NOT NULL,
                `status` varchar(30) NOT NULL DEFAULT 'pending',
                `timestamp` bigint(30) NOT NULL,
                `reviewer` longtext DEFAULT NULL,
                `reviewNote` varchar(300) DEFAULT NULL,
                `reviewedAt` bigint(30) DEFAULT NULL,
                `job` varchar(60) NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_applications')
    end

    if not tableExists('p_mdt_bolo') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_bolo` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `title` varchar(100) NOT NULL,
                `description` longtext NOT NULL,
                `target` longtext NOT NULL,
                `tags` longtext NOT NULL,
                `status` varchar(20) NOT NULL,
                `creator` longtext NOT NULL,
                `timestamp` bigint(30) NOT NULL,
                `expire` bigint(30) DEFAULT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_bolo')
    end

    if not tableExists('p_mdt_charges') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_charges` (
                `name` varchar(60) NOT NULL,
                `charges` longtext NOT NULL,
                PRIMARY KEY (`name`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_charges')
    end

    if not tableExists('p_mdt_citizens') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_citizens` (
                `identifier` varchar(100) NOT NULL,
                `avatar` longtext DEFAULT NULL,
                `notes` longtext NOT NULL DEFAULT '[]',
                PRIMARY KEY (`identifier`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_citizens')
    end

    if not tableExists('p_mdt_evidences') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_evidences` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `type` varchar(40) NOT NULL,
                `title` varchar(200) NOT NULL,
                `description` longtext NOT NULL,
                `location` varchar(100) NOT NULL,
                `itemData` longtext DEFAULT NULL,
                `mediaUrl` longtext NOT NULL,
                `creator` longtext NOT NULL,
                `history` longtext NOT NULL DEFAULT '[]',
                `status` varchar(30) NOT NULL DEFAULT 'undeposited',
                `timestamp` bigint(30) NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_evidences')
    end

    if not tableExists('p_mdt_garage') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_garage` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `vehicle` longtext NOT NULL,
                `job` varchar(60) NOT NULL,
                `status` varchar(10) NOT NULL,
                `grades` longtext NOT NULL DEFAULT '[]',
                `officers` longtext NOT NULL DEFAULT '[]',
                `licences` longtext NOT NULL DEFAULT '[]',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_garage')
    end

    if not tableExists('p_mdt_incidents') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_incidents` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `title` varchar(100) NOT NULL,
                `description` longtext NOT NULL,
                `tags` longtext NOT NULL,
                `creator` longtext NOT NULL,
                `timestamp` bigint(30) NOT NULL,
                `expire` bigint(30) DEFAULT NULL,
                `citizens` longtext DEFAULT NULL,
                `vehicles` longtext DEFAULT NULL,
                `status` varchar(15) NOT NULL DEFAULT 'open',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_incidents')
    end

    if not tableExists('p_mdt_judgments') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_judgments` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `targets` longtext NOT NULL,
                `charges` longtext NOT NULL,
                `timestamp` bigint(30) NOT NULL,
                `officer` longtext NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_judgments')
    end

    if not tableExists('p_mdt_logs') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_logs` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `identifier` varchar(100) NOT NULL,
                `category` varchar(60) NOT NULL,
                `action` varchar(60) NOT NULL,
                `message` varchar(300) NOT NULL,
                `name` varchar(200) NOT NULL,
                `timestamp` bigint(30) NOT NULL,
                `job` varchar(30) NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_logs')
    end

    if not tableExists('p_mdt_officers') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_officers` (
                `identifier` varchar(100) NOT NULL,
                `data` longtext DEFAULT NULL,
                `licences` longtext NOT NULL DEFAULT '[]',
                PRIMARY KEY (`identifier`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_officers')
    end

    if not tableExists('p_mdt_permissions') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_permissions` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `job` varchar(60) NOT NULL,
                `grade` varchar(60) NOT NULL,
                `permissions` longtext NOT NULL,
                `timestamp` bigint(30) NOT NULL,
                `modifiedBy` varchar(120) NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_permissions')
    end

    if not tableExists('p_mdt_reports') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_reports` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `title` varchar(200) NOT NULL,
                `type` varchar(50) NOT NULL,
                `status` varchar(30) NOT NULL DEFAULT 'open',
                `content` longtext NOT NULL,
                `tags` longtext NOT NULL,
                `officers` longtext NOT NULL,
                `suspects` longtext NOT NULL,
                `civilians` longtext NOT NULL,
                `vehicles` longtext NOT NULL,
                `photos` longtext NOT NULL,
                `weapons` longtext NOT NULL,
                `evidences` longtext NOT NULL,
                `incidents` longtext NOT NULL,
                `warrants` longtext NOT NULL,
                `timestamp` bigint(30) NOT NULL,
                `creator` longtext NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_reports')
    end

    if not tableExists('p_mdt_vehicles') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_vehicles` (
                `plate` varchar(10) NOT NULL,
                `avatar` longtext DEFAULT NULL,
                `notes` longtext NOT NULL DEFAULT '[]',
                `photos` longtext NOT NULL DEFAULT '[]',
                PRIMARY KEY (`plate`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_vehicles')
    end

    if not tableExists('p_mdt_warrants') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_warrants` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `type` varchar(60) NOT NULL,
                `title` varchar(200) NOT NULL,
                `content` longtext NOT NULL,
                `target` longtext NOT NULL,
                `location` varchar(200) DEFAULT NULL,
                `status` varchar(30) NOT NULL DEFAULT 'active',
                `expire` bigint(30) DEFAULT NULL,
                `timestamp` bigint(30) NOT NULL,
                `creator` longtext NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_warrants')
    end

    if not tableExists('p_mdt_weapons') then
        MySQL.Async.execute([[
            CREATE TABLE `p_mdt_weapons` (
                `serial` varchar(30) NOT NULL,
                `model` varchar(100) NOT NULL,
                `owner` longtext NOT NULL,
                `timestamp` bigint(30) NOT NULL,
                `note` longtext DEFAULT NULL,
                PRIMARY KEY (`serial`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
        ]])
        lib.print.info('Created table: p_mdt_weapons')
    end

    Citizen.Wait(1000)
    lib.print.info('Database check completed')
end)