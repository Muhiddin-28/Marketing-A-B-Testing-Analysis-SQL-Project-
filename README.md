# Marketing Campaign Performance Analysis (SQL Case Study)

## Project Summary

This project is a full SQL-based marketing analytics case designed to
evaluate campaign performance and guide budget reallocation decisions.

Using a 9-step analytical pipeline, the project moves from raw data
cleaning to micro-segmentation insights, revealing that true performance
differences emerge only when channel and customer segment are analyzed
together.

------------------------------------------------------------------------

## Business Problem

A multi-channel company wants to: - Maximize Return on Investment
(ROI) - Reduce waste from low-performing campaigns - Reallocate
marketing budget based on real performance data

------------------------------------------------------------------------

## Dataset

Each row represents a single marketing campaign.

Columns: Campaign_ID, Company, Campaign_Type, Target_Audience, Duration,
Channel_Used, Conversion_Rate, Acquisition_Cost, ROI, Location,
Language, Clicks, Impressions, Engagement_Score, Customer_Segment, Date

------------------------------------------------------------------------

## Analysis Pipeline

1.  data_cleaning.sql -- Remove invalid rows and standardize data\
2.  funnel_by_channel.sql -- Analyze CTR and conversion drop-off\
3.  roi_vs_conversion.sql -- Test if ROI is driven by conversions\
4.  underperforming_campaigns.sql -- Identify low-ROI campaigns\
5.  top_channels_roi.sql -- Benchmark channels by ROI\
6.  top_segments.sql -- Evaluate customer segment performance\
7.  geo_roi.sql -- Analyze geographic impact\
8.  pareto_channels.sql -- Apply 80/20 channel analysis\
9.  final_recommendations.sql -- Identify top channel--segment pairs

------------------------------------------------------------------------

## Key Insights

-   Funnel metrics are nearly identical across all channels.
-   Channel and segment level ROI differences are negligible.
-   Geography does not significantly impact ROI.
-   Micro-segmentation reveals the highest-performing combinations.

------------------------------------------------------------------------

## Strategic Recommendation

Marketing budget should be distributed based on channel--segment
performance matrices rather than channels alone.

------------------------------------------------------------------------

## Tools Used

PostgreSQL / MySQL\
Power BI / Tableau (optional)\
Excel (optional)

------------------------------------------------------------------------

## Author

Muhiddin Axmadov
