# Hannah's Blog

### A recreation of my wife's blog (populated with Faker).

#### https://www.hannahbauer.me/

## Available Commands

In the project directory, you can run:

#### `heroku run rails c`

Access heroku production console.

#### `heroku pg:reset && heroku run rails db:migrate && heroku run db:seed`

Reset database and clear all data.

### Technologies Used:

- Ruby on Rails
  - Validations & Testing
- Mobile-first Development
  - Vanilla CSS/SASS & JavaScript
- Admin Authentication & Authorization
  - Devise
- Accessibility
  - Axe DevTools
- Web Scraping
  - Wrote using Ruby
- Web Hosting
  - Heroku / Render
  - Cloudflare
- Image Hosting
  - AWS
- Mailers
  - SendGrid
- Faker

### Deploy with Render

- bin/render-build.sh
