CREATE DATABASE IF NOT EXISTS portfolio;
USE portfolio;

CREATE TABLE IF NOT EXISTS projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  category ENUM('dev', 'gis', 'server') NOT NULL,
  summary VARCHAR(300) NOT NULL,
  description TEXT,
  stack VARCHAR(200),
  result_metric VARCHAR(150),
  demo_url VARCHAR(255),
  repo_url VARCHAR(255),
  image_url VARCHAR(255),
  featured BOOLEAN DEFAULT FALSE,
  sort_order INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS contact_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  subject VARCHAR(150),
  message TEXT NOT NULL,
  read_status BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Données de démarrage basées sur tes projets réels
INSERT INTO projects (title, category, summary, description, stack, result_metric, featured, sort_order) VALUES
('Classification occupation du sol - zone périurbaine', 'gis',
 'Classification supervisée et non-supervisée sur imagerie Sentinel-2 avec QGIS et OTB.',
 'Analyse de télédétection appliquant Random Forest pour classifier l''occupation du sol d''une zone périurbaine, avec comparaison des méthodes supervisées et non-supervisées.',
 'QGIS, Orfeo ToolBox, Sentinel-2, Random Forest', 'Kappa 0.927', TRUE, 1),
('Gestion_Etudiant - Système de gestion étudiants', 'dev',
 'Application Python orientée objet avec persistance JSON.',
 'Système complet de gestion des étudiants utilisant classes abstraites, exceptions personnalisées et persistance des données.',
 'Python, POO, JSON', NULL, TRUE, 2),
('Mikaelou''s House - Site vitrine client', 'dev',
 'Site WordPress complet pour un client à Dakar.',
 'Conception et développement d''un site vitrine avec Elementor et le thème Astra, déployé sur serveur Ubuntu personnel.',
 'WordPress, Elementor, Astra, NGINX', NULL, TRUE, 3),
('Infrastructure serveur Ubuntu multi-domaines', 'server',
 'Serveur LAMP/LEMP avec DNS, virtual hosts et partage de fichiers.',
 'Configuration complète d''un serveur Ubuntu (NGINX + Apache en cohabitation sur le port 80, BIND9, Samba, MariaDB) hébergeant plusieurs domaines.',
 'Ubuntu Server, NGINX, Apache, BIND9, MariaDB, Samba', NULL, FALSE, 4);
