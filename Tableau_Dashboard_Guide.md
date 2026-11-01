# Building the Tableau Dashboard

You already have Tableau listed as a skill — this turns the exported CSVs into an actual dashboard you can screenshot for your portfolio/resume and speak to in interviews.

## 1. Connect
Open Tableau Desktop/Public → **Connect → Text File** → select `exports/netflix_titles_cleaned.csv`. This is your main data source.

## 2. Sheets to build
Create these as separate sheets, then combine into one dashboard:

1. **Catalog Growth (Line Chart)**
   - Columns: `year_added` → Rows: `COUNT(title)`, colored by `type` (Movie/TV Show)
   - Shows the growth trend you found in Python — now interactive.

2. **Top Genres (Bar Chart)**
   - Use `exports/rating_share.csv`-style approach, or split `listed_in` in Tableau using a calculated field (`SPLIT`) and filter Top 10 by count.

3. **Top Countries (Bar Chart)**
   - Split `country` on `,` similarly, or connect `exports/` country table if you export one; filter to Top 10.

4. **Rating Mix (Bar or Treemap)**
   - Columns: `rating` → Rows: `COUNT(title)`. Sort descending.

5. **Movie Duration (Histogram)**
   - Right-click `duration_minutes` → Create → Bins (bin size ~10). Rows: `COUNT(title)`.

## 3. Assemble the dashboard
- **Dashboard → New Dashboard**, drag all 5 sheets onto one canvas.
- Add a title: "OTT Content Catalog Analytics".
- Add a filter action: clicking a genre or country bar filters the other charts (Dashboard → Actions → Add Filter Action).

## 4. Publish / export
- **Tableau Public** (free): Server → Save to Tableau Public → you get a shareable link to put on your resume/LinkedIn.
- Or File → Export Image for a static screenshot if you don't want to publish publicly.

## What to say about it in an interview
"I took the same cleaned dataset from my Python/SQL analysis and built an interactive Tableau dashboard so a non-technical stakeholder could explore content trends themselves — filtering by genre or country without needing to touch code."
