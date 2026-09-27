# COLORS (LAMP Stack Web App)

A small web application built for the COP 4331 COLORS Lab. Users log in and
can add colors to their personal list or search the colors they've saved.
It demonstrates a basic client–server design: a static HTML/JS front end that
calls a PHP JSON API backed by a MySQL database.

## Technologies
- **Linux**: Ubuntu server (e.g., DigitalOcean droplet)
- **Apache**: web server hosting the front end and API
- **MySQL**: stores users and colors
- **PHP**: REST-style JSON endpoints
- **HTML / CSS / JavaScript**: front end (vanilla JS, `fetch`/XHR, MD5 hashing)

## Project Structure
```
api/        PHP endpoints (Login, AddColor, SearchColors)
public/     Static front end (HTML, CSS, JS)
database/   SQL schema for the Users and Colors tables
```

## API Endpoints
| Endpoint | Method | Request body | Response |
|---|---|---|---|
| `api/Login.php` | POST | `{ "login", "password" }` | `{ "id", "firstName", "lastName", "error" }` |
| `api/AddColor.php` | POST | `{ "color", "userId" }` | `{ "error" }` |
| `api/SearchColors.php` | POST | `{ "search", "userId" }` | `{ "results": [...], "error" }` |

## Setup
1. Provision a LAMP server (Apache, MySQL, PHP installed).
2. Create the database and tables:
```bash
   mysql -u root -p < database/schema.sql
```
3. Create a MySQL user with access to the database.
4. Copy the config template and add your credentials:
```bash
   cp api/config.example.php api/config.php
```
5. Copy `public/` and `api/` to the web root (e.g., `/var/www/html/`).
6. In `public/js/code.js`, set the API base URL to your server's domain or IP.

## Running / Accessing
Open `http://<your-server-ip-or-domain>/` in a browser, log in with a user
from the `Users` table, then add or search colors.

## Assumptions & Limitations
- Users are created directly in the database; there is no sign-up page.
- Passwords are hashed client-side with MD5, which is not secure for
  production use (no salting, weak algorithm).
- Sessions use a simple browser cookie, not server-side session management.
- Intended to run over HTTP for the lab; production would need HTTPS.
- No edit or delete functionality for colors.
