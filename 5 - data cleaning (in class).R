library(tidyverse)

raw <- read_csv('https://www.dropbox.com/scl/fi/ug8tbxsdd2qtsfqwnnox1/dollar_store.csv?rlkey=fu36g6uhfpx8u644d1rpsq11i&dl=1')

# Convert to number formats: price, star_rating, review_count, stock_status, unit_size
#   Goals:   (1) Don't lose information
#            (2) Missing where appropriate, but only where appropriate
clean <- raw |>
  janitor::clean_names()

clean |>
  count(unit_size) |>
  print(n = 100)

clean |>
  mutate(star_rating = parse_number(star_rating, na = c('Product rating is not available'))) |>
  mutate(price = parse_number(price)) |>
  mutate(unit_size = na_if(unit_size, "Unit Size not available")) |>
  separate_wider_delim(unit_size, delim = ' ', names = c('unit_num', 'unit_type')) |>
  mutate(date_added = dmy(date_added)) |>
  mutate(first_sold_day = mdy(first_sold_day))
  
  

# replace_na()
# replace_na(star_rating_c, 0)
# na_if()
# na_if(star_raing, 'Product rating is not available')
# mutate(unit_type_each = str_detect(unit_size, "each"))

# Create usable brand and product_name columns from the product_info column
#   Hints:  (1) Ensure missingness is appropriate. 
#           (2) If possible, exploit any repeated structure in the column


# Create usable brand and product_name columns from the product_info column
#   Hints:  (1) Ensure missingness is appropriate. 
#           (2) If possible, exploit any repeated structure in the column


# Convert date columns to date and/or date-time columns, then calculate how many
# days each product sat on the shelf before its first sale.


