# How to Explain This Project in an Interview

## 30-second version (if asked "walk me through a project")
"I built an end-to-end analysis of an OTT content catalog — about 7,800 titles — similar to the domain I work in as a QA engineer, but from a data-analyst angle instead of a testing angle. I cleaned the raw data in Python, ran exploratory analysis to find trends in content growth and genre mix, wrote SQL queries against the same data in SQLite to answer specific business questions, and exported the results into Tableau for an interactive dashboard. The goal was to practice the full pipeline — cleaning, analysis, SQL, and visualization — on realistic messy data."

## STAR-format version (if asked "tell me about a project you're proud of")
- **Situation:** I wanted to move from QA into data analytics/engineering, and needed a project that showed I could handle a full data pipeline, not just run one script.
- **Task:** Analyze a real-world OTT content dataset to surface trends useful to a content/product team — growth, genre mix, geography, ratings, runtime.
- **Action:** Cleaned the data (handled ~30% missing values in `director`/`cast`/`country` deliberately, rather than dropping rows), split a mixed-unit column into two clean numeric fields, exploded multi-value genre/country fields for correct counting, ran 7 EDA visualizations in Python, then re-answered 5 of the same business questions in SQL against a SQLite database, and exported the results for a Tableau dashboard.
- **Result:** Found that the catalog is ~69% movies, additions peaked around 2019, "International" content is the single biggest genre category, and mature (TV-MA) content dominates the ratings mix — the kind of finding a content strategy team would act on.

## Be ready for these follow-up questions

**"Why did you fill missing values instead of dropping them?"**
→ "About 30% of rows were missing at least one of director/cast/country. Dropping any row with a missing value would have thrown away a third of the dataset and skewed results toward better-documented (mostly US) titles. Filling with 'Unknown' keeps every row available for the aggregations that don't depend on that field."

**"Why explode the genre/country columns instead of just using them as-is?"**
→ "A title like 'Dramas, International Movies, Thrillers' is one row, but it belongs to three genres. If I count genres without splitting, that title is invisible to per-genre analysis. Exploding it — one row per genre — makes each genre's count correct, while the original single-row dataset is still used for anything that doesn't need per-genre granularity."

**"Why both Python and SQL for the same kind of questions?"**
→ "Different tools for different strengths — pandas is faster for iterative exploration and plotting, SQL is closer to what a lot of data infrastructure and BI tools actually run against. Doing the same analysis in SQL shows I can work directly against a database, not just a dataframe I've already loaded."

**"What would you do differently with more time / at production scale?"**
→ "This dataset is small enough to fully load into memory. At real scale I'd move the cleaning into a proper ETL pipeline (e.g. scheduled jobs writing to a warehouse table instead of a CSV), add data-quality checks / tests on incoming data, and think about incremental loading instead of reprocessing everything each run."

**"What's the business value of this?"**
→ "A content team deciding what to acquire or produce next could use the genre/country/rating trends to spot gaps — e.g. underrepresented genres or countries relative to audience demand — and the growth trend to benchmark catalog expansion pace against competitors."

**"Is this your own data or synthetic?"**
→ Be honest: it's a public dataset (Netflix Titles, commonly used for portfolio projects), not proprietary company data. The value is in the pipeline and analysis approach, which transfers directly to real production data.
