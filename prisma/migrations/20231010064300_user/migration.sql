-- CreateTable
CREATE TABLE `User` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(100) NOT NULL,
    `middleName` VARCHAR(100) NOT NULL,
    `lastName` VARCHAR(100) NOT NULL,
    `mobile` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `passwordHash` VARCHAR(255) NOT NULL,
    `registeredAt` TIMESTAMP(0) NULL,
    `lastLogin` TIMESTAMP(0) NULL,
    `profile` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `users_email_unique`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
