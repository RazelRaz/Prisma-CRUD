-- CreateTable
CREATE TABLE `Post` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `slug` VARCHAR(200) NOT NULL,
    `summary` VARCHAR(500) NOT NULL,
    `content` VARCHAR(500) NOT NULL,
    `publishedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `published` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `authorId` BIGINT UNSIGNED NOT NULL,

    UNIQUE INDEX `author_id_unique`(`authorId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comment` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `content` VARCHAR(500) NOT NULL,
    `publishedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `published` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `parentId` BIGINT UNSIGNED NOT NULL,
    `postId` BIGINT UNSIGNED NOT NULL,

    UNIQUE INDEX `parent_id_unique`(`parentId`),
    UNIQUE INDEX `post_id_unique`(`postId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tag` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `slug` VARCHAR(200) NOT NULL,
    `metaTitle` VARCHAR(200) NOT NULL,
    `content` VARCHAR(500) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `slug` VARCHAR(200) NOT NULL,
    `metaTitle` VARCHAR(200) NOT NULL,
    `content` VARCHAR(500) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PostTag` (
    `postId` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tagId` BIGINT UNSIGNED NOT NULL,

    UNIQUE INDEX `tag_id_unique`(`tagId`),
    PRIMARY KEY (`postId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PostCategory` (
    `postId` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `categoryId` BIGINT UNSIGNED NOT NULL,

    UNIQUE INDEX `post_category_id_unique`(`categoryId`),
    PRIMARY KEY (`postId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PostMeta` (
    `postId` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `key` VARCHAR(200) NOT NULL,
    `content` VARCHAR(500) NOT NULL,

    PRIMARY KEY (`postId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `Post_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tag` ADD CONSTRAINT `Tag_id_fkey` FOREIGN KEY (`id`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Category` ADD CONSTRAINT `Category_id_fkey` FOREIGN KEY (`id`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PostTag` ADD CONSTRAINT `PostTag_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PostCategory` ADD CONSTRAINT `PostCategory_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PostMeta` ADD CONSTRAINT `PostMeta_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
