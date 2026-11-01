# OTT Content Catalog Analytics

Analysis of a ~7,800-title OTT streaming catalog (Netflix Titles dataset) — content growth, genre mix, geographic sourcing, ratings, and runtime patterns. Built to apply data-analyst skills to the OTT/media domain I already work in as a QA engineer.

## Why this project
As a QA engineer on an OTT/media platform, I test whether the platform behaves correctly. This project asks a different question with the same domain knowledge: what does the underlying content data actually tell us — about growth, catalog composition, and audience skew — that a content or product team would care about?

## Tech stack
- **Python** (pandas, numpy) — data cleaning and transformation
- **Matplotlib / Seaborn** — exploratory visualizations
- **SQLite + SQL** — query-based analysis (GROUP BY, aggregates, derived columns)
- **Tableau-ready CSV exports** — for an interactive dashboard layer

## How to run locally
```bash
   git clone https://github.com/Vellingta/OTTDataScienceProject.git
   cd OTTDataScienceProject
   pip install -r requirements.txt
   jupyter notebook OTT_Content_Analytics.ipynb
```
Run the cells top to bottom (Shift+Enter). Outputs, charts and SQL tables are regenerated into `charts/` and `exports/`.

## Data source
Public Netflix Titles dataset (TidyTuesday, 2021-04-20). Not proprietary company data.

## Files
- `OTT_Content_Analytics.ipynb` — full, executed analysis notebook (start here)
- `data/netflix_titles.csv` — raw source data
- `exports/netflix_titles_cleaned.csv` — cleaned dataset
- `exports/*.csv` — SQL query outputs, ready for Tableau
- `charts/*.png` — exported chart images
- `queries.sql` — standalone SQL used in the analysis

## Approach
1. **Load & inspect** — check shape, dtypes, and missing-value pattern before touching anything.
2. **Clean deliberately** — parse dates; fill categorical gaps (`director`, `cast`, `country`) with `"Unknown"` instead of dropping rows, since dropping any row with a missing value would discard ~40% of the dataset and bias results toward better-documented titles; split the mixed-unit `duration` field into `duration_minutes` (movies) and `seasons` (TV shows).
3. **Explode multi-value fields** — `listed_in` (genres) and `country` can hold several comma-separated values per row; these are exploded into one row per value *only for the aggregations that need it*, so a title with three genres is correctly counted in all three.
4. **EDA in Python** — 7 visualizations covering content mix, yearly growth, top genres, top countries, ratings, movie duration, and seasonal add-patterns.
5. **SQL analysis** — the same cleaned data loaded into SQLite, answering 5 business questions purely in SQL (independent of pandas), to demonstrate query-writing directly.
6. **Export for Tableau** — summary tables written to `/exports` for building an interactive dashboard.

## Key Insights
- Catalog is ~69% Movies / 31% TV Shows.
- Additions grew from single digits (2014) to a peak of ~2,150 titles/year (2019), then eased in 2020 — consistent with an industry-wide content production slowdown.
- "International Movies" and "International TV Shows" are the single largest genre tags — this is a global catalog, not US-centric.
- The US contributes the largest single share of titles, with India, the UK, and Canada as strong secondary sources.
- TV-MA is the single largest content rating — the catalog skews toward mature audiences.
- Movies cluster around 90–115 minutes (median ~98 min); most TV shows run a single season, with a long tail of a few shows at 12–16 seasons.
- Content additions peak in December, October, and January — consistent with holiday/awards-season release timing.

## Next Steps
- Build an interactive Tableau dashboard on top of the `/exports` tables (see Tableau guide).
- Extend to a simple classification model (predict rating or genre from description) to add a machine-learning component.
