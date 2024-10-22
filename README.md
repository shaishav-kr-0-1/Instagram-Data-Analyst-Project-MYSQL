# Instagram Data Analyst Project

## Overview

This project involves the creation and analysis of a MySQL database that simulates an Instagram-like application. The database contains various tables that capture user interactions, including photos, comments, likes, follows, and tags. The purpose of this project is to analyze user behavior and interactions within the platform, allowing for insights into trends and engagement metrics.

## Database Structure

The database consists of the following tables:

### 1. Users
- **Table Name**: `users`
- **Description**: Stores information about users.
- **Columns**:
  - `id`: INT (Auto-increment, Primary Key) - Unique identifier for each user.
  - `username`: VARCHAR(255) - User's username.
  - `created_at`: TIMESTAMP - Timestamp when the user account was created.

### 2. Photos
- **Table Name**: `photos`
- **Description**: Stores information about photos uploaded by users.
- **Columns**:
  - `id`: INT (Auto-increment, Primary Key) - Unique identifier for each photo.
  - `image_url`: VARCHAR(355) - URL of the uploaded photo.
  - `user_id`: INT - Foreign key referencing the `users` table.
  - `created_at`: TIMESTAMP - Timestamp when the photo was uploaded.

### 3. Comments
- **Table Name**: `comments`
- **Description**: Stores comments made on photos.
- **Columns**:
  - `id`: INT (Auto-increment, Primary Key) - Unique identifier for each comment.
  - `comment_text`: VARCHAR(255) - The text of the comment.
  - `user_id`: INT - Foreign key referencing the `users` table.
  - `photo_id`: INT - Foreign key referencing the `photos` table.
  - `created_at`: TIMESTAMP - Timestamp when the comment was made.

### 4. Likes
- **Table Name**: `likes`
- **Description**: Records likes on photos by users.
- **Columns**:
  - `user_id`: INT - Foreign key referencing the `users` table.
  - `photo_id`: INT - Foreign key referencing the `photos` table.
  - `created_at`: TIMESTAMP - Timestamp when the like was made.
- **Primary Key**: Combination of `user_id` and `photo_id`.

### 5. Follows
- **Table Name**: `follows`
- **Description**: Records follow relationships between users.
- **Columns**:
  - `follower_id`: INT - Foreign key referencing the `users` table (the user who follows).
  - `followee_id`: INT - Foreign key referencing the `users` table (the user being followed).
  - `created_at`: TIMESTAMP - Timestamp when the follow action occurred.
- **Primary Key**: Combination of `follower_id` and `followee_id`.

### 6. Tags
- **Table Name**: `tags`
- **Description**: Stores tags that can be associated with photos.
- **Columns**:
  - `id`: INT (Auto-increment, Primary Key) - Unique identifier for each tag.
  - `tag_name`: VARCHAR(255) - Name 
