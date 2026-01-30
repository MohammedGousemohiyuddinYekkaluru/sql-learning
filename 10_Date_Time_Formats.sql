/* ==============================================================================
   SQL Date & Time Functions
-------------------------------------------------------------------------------
   This script shows all possible date parts, number formats, and 
   culture-specific styles available in SQL Server.
   
   Table of Contents:
     1. Number Format Specifiers
     2. Date Format Specifiers
     3. All Date Parts
     4. All Culture Formats
===============================================================================
*/

/* ==============================================================================
   NUMERIC FORMAT SPECIFIERS
===============================================================================*/

SELECT 'N' AS FormatType, FORMAT(1234.56, 'N') AS FormattedValue
UNION ALL
SELECT 'P' AS FormatType, FORMAT(1234.56, 'P') AS FormattedValue
UNION ALL
SELECT 'C' AS FormatType, FORMAT(1234.56, 'C') AS FormattedValue
UNION ALL
SELECT 'E' AS FormatType, FORMAT(1234.56, 'E') AS FormattedValue
UNION ALL
SELECT 'F' AS FormatType, FORMAT(1234.56, 'F') AS FormattedValue
UNION ALL
SELECT 'N0' AS FormatType, FORMAT(1234.56, 'N0') AS FormattedValue
UNION ALL
SELECT 'N1' AS FormatType, FORMAT(1234.56, 'N1') AS FormattedValue
UNION ALL
SELECT 'N2' AS FormatType, FORMAT(1234.56, 'N2') AS FormattedValue
UNION ALL
SELECT 'N_de-DE' AS FormatType, FORMAT(1234.56, 'N', 'de-DE') AS FormattedValue
UNION ALL
SELECT 'N_en-US' AS FormatType, FORMAT(1234.56, 'N', 'en-US') AS FormattedValue;

/* ==============================================================================
   DATE FORMAT SPECIFIERS
===============================================================================*/

SELECT 
    'D' AS FormatType, 
    FORMAT(GETDATE(), 'D') AS FormattedValue,
    'Full date pattern' AS Description
UNION ALL
SELECT 
    'd', 
    FORMAT(GETDATE(), 'd'), 
    'Short date pattern'
UNION ALL
SELECT 
    'dd', 
    FORMAT(GETDATE(), 'dd'), 
    'Day of month with leading zero'
UNION ALL
SELECT 
    'ddd', 
    FORMAT(GETDATE(), 'ddd'), 
    'Abbreviated name of day'
UNION ALL
SELECT 
    'dddd', 
    FORMAT(GETDATE(), 'dddd'), 
    'Full name of day'
UNION ALL
SELECT 
    'M', 
    FORMAT(GETDATE(), 'M'), 
    'Month without leading zero'
UNION ALL
SELECT 
    'MM', 
    FORMAT(GETDATE(), 'MM'), 
    'Month with leading zero'
UNION ALL
SELECT 
    'MMM', 
    FORMAT(GETDATE(), 'MMM'), 
    'Abbreviated name of month'
UNION ALL
SELECT 
    'MMMM', 
    FORMAT(GETDATE(), 'MMMM'), 
    'Full name of month'
UNION ALL
SELECT 
    'yy', 
    FORMAT(GETDATE(), 'yy'), 
    'Two-digit year'
UNION ALL
SELECT 
    'yyyy', 
    FORMAT(GETDATE(), 'yyyy'), 
    'Four-digit year'
UNION ALL
SELECT 
    'hh', 
    FORMAT(GETDATE(), 'hh'), 
    'Hour in 12-hour clock with leading zero'
UNION ALL
SELECT 
    'HH', 
    FORMAT(GETDATE(), 'HH'), 
    'Hour in 24-hour clock with leading zero'
UNION ALL
SELECT 
    'm', 
    FORMAT(GETDATE(), 'm'), 
    'Minutes without leading zero'
UNION ALL
SELECT 
    'mm', 
    FORMAT(GETDATE(), 'mm'), 
    'Minutes with leading zero'
UNION ALL
SELECT 
    's', 
    FORMAT(GETDATE(), 's'), 
    'Seconds without leading zero'
UNION ALL
SELECT 
    'ss', 
    FORMAT(GETDATE(), 'ss'), 
    'Seconds with leading zero'
UNION ALL
SELECT 
    'f', 
    FORMAT(GETDATE(), 'f'), 
    'Tenths of a second'
UNION ALL
SELECT 
    'ff', 
    FORMAT(GETDATE(), 'ff'), 
    'Hundredths of a second'
UNION ALL
SELECT 
    'fff', 
    FORMAT(GETDATE(), 'fff'), 
    'Milliseconds'
UNION ALL
SELECT 
    'T', 
    FORMAT(GETDATE(), 'T'), 
    'Full AM/PM designator'
UNION ALL
SELECT 
    't', 
    FORMAT(GETDATE(), 't'), 
    'Single character AM/PM designator'
UNION ALL
SELECT 
    'tt', 
    FORMAT(GETDATE(), 'tt'), 
    'Two character AM/PM designator';