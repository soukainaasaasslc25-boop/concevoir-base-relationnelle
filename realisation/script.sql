

CREATE DATABASE  fleurblog;
    

USE fleurblog;


CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,          
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE categories (
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE,
    description TEXT
);


CREATE TABLE posts (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    publication_date DATE NOT NULL,
    status ENUM('publié', 'brouillon') ,
    image_url VARCHAR(255),                  
    id_user INT NOT NULL,                    
    id_category INT NULL ,               
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   
    FOREIGN KEY (id_user) REFERENCES users(id_user) ,
    FOREIGN KEY (id_category) REFERENCES categories(id_category) 
);


CREATE TABLE comments (
    id_comment INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_post INT NOT NULL,
    id_user INT NOT NULL,                    
    
    FOREIGN KEY (id_post) REFERENCES posts(id_post),
    FOREIGN KEY (id_user) REFERENCES users(id_user) 
);




INSERT INTO users (username, email, password) VALUES
('admin_fleur', 'admin@fleurs.rs', '$2y$10$exemple_hash_admin'),   
('botaniste', 'botaniste@example.com', '$2y$10$exemple_hash_botaniste');


INSERT INTO categories (name, description) VALUES
('Tulipe', 'Tout sur les tulipes : variétés, culture, symbolique'),
('Rose', 'La reine des fleurs : couleurs, parfums et significations'),
('Botanique générale', 'Articles scientifiques sur la biologie des fleurs'),
('Orchidée', 'Fleurs exotiques et délicates');


INSERT INTO posts (title, content, publication_date, status, image_url, id_user, id_category) VALUES
('La tulipe noire : mythe ou réalité ?', 'Article détaillé sur l’histoire de la tulipe noire pendant la Tulipomanie...', '2025-12-20', 'publié', 'tulipe-noire.jpg', 1, 1),
('Les pigments des pétales de rose', 'Explication scientifique des anthocyanes et caroténoïdes responsables des couleurs...', '2025-12-26', 'publié', 'pigments-rose.jpg', 2, 3),
('Comment cultiver des orchidées à la maison', 'Guide pratique avec conseils d’arrosage et lumière...', '2025-12-25', 'brouillon', 'orchidee-maison.jpg', 1, 4);


INSERT INTO comments (content, id_post, id_user) VALUES
('Super article ! J’ai réussi à faire pousser des tulipes noires grâce à vos conseils.', 1, 2),
('Très intéressant sur les pigments, avez-vous des références bibliographiques ?', 2, 1);



SHOW TABLES;

DESCRIBE users;
DESCRIBE categories;
DESCRIBE posts;
DESCRIBE comments;

SELECT 'Base de données fleur_blog créée avec succès ! 🌷' AS Message;
select * from fleurblog.posts;