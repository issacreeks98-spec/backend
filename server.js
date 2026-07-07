import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import rateLimit from 'express-rate-limit';
import projectsRouter from './routes/projects.js';
import contactRouter from './routes/contact.js';

dotenv.config();
const app = express();

app.use(cors({ origin: process.env.FRONTEND_URL || '*' }));
app.use(express.json());

// Limite anti-spam sur le formulaire de contact
const contactLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5,
  message: { error: 'Trop de messages envoyés. Réessaie plus tard.' }
});

app.get('/api/health', (req, res) => res.json({ status: 'ok' }));
app.use('/api/projects', projectsRouter);
app.use('/api/contact', contactLimiter, contactRouter);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`API en écoute sur le port ${PORT}`));
