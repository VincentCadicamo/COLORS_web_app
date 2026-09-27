# COLORS (LAMP Stack Web App)

A small web application built for the COP 4331 COLORS Lab. Users log in, then
add colors to their personal list or search the colors saved to their account.
Each user only sees colors tied to their own user ID. The app is a static
HTML/CSS/JS front end calling a PHP JSON API backed by MySQL.

Live at: https://colorslab.vincentcadicamo.dev

## Technologies
- **Linux**: Ubuntu VM on Google Cloud Platform
- **Apache**: serves the front end and PHP API over HTTPS
- **MySQL**: `COP4331` database (`Users`, `Colors`, `Contacts` tables)
- **PHP**: JSON endpoints using `mysqli` prepared statements
- **HTML / CSS / JavaScript**: vanilla JS front end; `md5.js` (MIT, Sebastian Tschan)
- **GitHub Actions**: deploys `public/` to the server via rsync

## Project Structure
```
.github/workflows/deploy.yml   CI deploy to the GCP server
db/bootstrap.sql               Creates the database and API user
db/schema.sql                  Tables and seed data (safe to re-run)
public/                        Web root
  index.html                   Login page
  color.html                   Add/search colors page
  css/  js/  images/
  LAMPAPI/                     PHP API endpoints
    config.example.php         Credential template (copy to config.php)
```

## API Endpoints
All endpoints accept and return JSON via POST under `/LAMPAPI/`.

| Endpoint | Request body | Response |
|---|---|---|
| `Login.php` | `{ "login", "password" }` | `{ "id", "firstName", "lastName", "error" }` |
| `AddColor.php` | `{ "color", "userId" }` | `{ "error" }` |
| `SearchColors.php` | `{ "search", "userId" }` | `{ "results": [...], "error" }` |

## Setup
1. Provision an Ubuntu server with Apache, MySQL, and PHP (`php-mysql`).
2. Edit `db/bootstrap.sql` to set a password for the API user, then run:
```bash
   sudo mysql < db/bootstrap.sql
   sudo mysql COP4331 < db/schema.sql
```
3. Create the server config (never committed):
```bash
   cp public/LAMPAPI/config.example.php public/LAMPAPI/config.php
```
and fill in the database credentials.
4. Deploy `public/` to `/var/www/html/`, either manually or via the GitHub
   Actions workflow (requires repository secrets for the host, user, and SSH key).
5. In `public/js/code.js`, set `urlBase` to your own domain.

## Running / Accessing
Open `https://colorslab.vincentcadicamo.dev/`, log in with a user from the `Users` table
(seed data in `db/schema.sql`), then add or search colors.

## Assumptions & Limitations
- There is no sign-up page; users are created in the database.
- Login state is a browser cookie (20 min), not a server-side session.
- No edit or delete for colors.
- An empty search returns an error payload rather than a clean "no results" message.
- The `Contacts` table is created but not used by this lab.