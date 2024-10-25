-- 1. Users Table

-- 1a.How many users have signed up?
SELECT 
    COUNT(*)
FROM
    users;


-- 1b .On which Month  maximum numbers of users joined instagram.
SELECT 
    MONTHNAME(created_at) AS 'Month',
    COUNT(username) AS USERS_JOINED
FROM
    users
GROUP BY 1
ORDER BY COUNT(username) DESC
LIMIT 1;

-- 1c. When was a specific user’s account created?
SELECT 
    username, created_at
FROM
    users
WHERE
    username = 'specific_user';
-- ----------------------------------------------------------------
-- -2. Photos Table

-- -2a. How many photos have been uploaded in total?
SELECT 
    COUNT(id) AS total_photos
FROM
    photos;

-- -2b. Which user has uploaded the most photos?
SELECT 
    username, COUNT(photos.id)
FROM
    users
        JOIN
    photos ON users.id = photos.user_id
GROUP BY 1
ORDER BY COUNT(photos.id) DESC;


-- -2c. What is the distribution of photos uploaded over time (daily, monthly)?
Select Monthname(created_dat) as "Month", year(created_dat) , count(user_id) as "No. of photos uploaded"  from photos
group by monthname(created_dat), year(created_dat) 
order by  monthname(created_dat) ,year(created_dat) ;



-- 2d. Can we retrieve all photos uploaded by a specific user?
SELECT 
    image_url
FROM
    photos
WHERE
    id = 'specific user';


-- 2e. Which photo has the most interactions (likes, comments)?

SELECT p.id, 
       p.image_url, 
       COUNT(DISTINCT l.user_id) AS total_likes, 
       COUNT(DISTINCT c.id) AS total_comments, 
       (COUNT(DISTINCT l.user_id) + COUNT(DISTINCT c.id)) AS total_interactions
FROM photos p
 JOIN likes l ON p.id = l.photo_id
JOIN comments c ON p.id = c.photo_id
GROUP BY p.id
ORDER BY total_interactions DESC
LIMIT 1;

-- ----------------------------------------------------------------

-- 3. Comments Table

-- 3a Which photo has the most comments?
SELECT 
    photo_id, COUNT(c.id)
FROM
    comments c
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

-- 3b Which user has posted the most comments?

SELECT 
    user_id, COUNT(id) AS total_comments
FROM
    comments
GROUP BY user_id
ORDER BY total_comments DESC
LIMIT 1;

-- 3c How many comments have been made on a specific photo?

select photo_id , count(id) from comments 
group by 1
order by 2 desc;

-- 3d How many comments were posted by a particular user on various photos?
select user_id , photo_id, count(comments.id) from comments 
where user_id = 79
group by user_id , photo_id;


-- 4. Likes Table
--  4a .Which user has liked the most photos?

select user_id , count(photo_id) from likes 
group by user_id
order by count(photo_id) desc ;

-- 4b.How many likes does a specific photo have?

SELECT 
    photo_id, COUNT(user_id)
FROM
    likes
WHERE
    photo_id = 'Specific photo id'
GROUP BY photo_id;


-- 4c. Which photos have received the most likes?

SELECT 
    photo_id, COUNT(user_id) AS 'No. of Likes'
FROM
    likes
GROUP BY photo_id
ORDER BY COUNT(user_id) DESC
LIMIT 1;


-- 4d. How can we find photos liked by a particular user?
SELECT 
    user_id, photo_id
FROM
    likes
WHERE
    user_id = 'specific user ';

-- ---------------------------------------------------------------

-- 5. Tags Table
-- 5a. How many unique tags have been created?
   
SELECT DISTINCT
    tag_name, id
FROM
    tags;

-- 5b. Which tags are associated with the most photos?
   
SELECT 
    tag_name, COUNT(photo_id)
FROM
    photo_tags
        JOIN
    tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY COUNT(photo_id) DESC
LIMIT 1;
   
-- -------------------------------------------------------------------