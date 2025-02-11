# precipitation indicator works

    Code
      .calc_precipitation_chirps(shp, chirps)
    Output
      [[1]]
      # A tibble: 132 x 4
         dates      absolute anomaly   spi_3
         <date>        <dbl>   <dbl>   <dbl>
       1 2000-01-01        8  -3.1    2.46  
       2 2000-02-01       19  -0.133  0.0559
       3 2000-03-01       25 -18.1   -0.744 
       4 2000-04-01       74 -37.7   -1.30  
       5 2000-05-01      145 -45.9   -1.20  
       6 2000-06-01       59 -48.5   -1.56  
       7 2000-07-01       67 -14.7   -1.11  
       8 2000-08-01      174  56.4   -0.364 
       9 2000-09-01      142 -10.3    0.342 
      10 2000-10-01      131 -15.2    0.253 
      # ... with 122 more rows
      # i Use `print(n = ...)` to see more rows
      

---

    Code
      .calc_precipitation_chirps(shp, chirps, scales_spi = c(12, 24), spi_prev_years = 12)
    Output
      [[1]]
      # A tibble: 132 x 5
         dates      absolute anomaly spi_12 spi_24
         <date>        <dbl>   <dbl>  <dbl>  <dbl>
       1 2000-01-01        8  -3.1    1.39  1.01  
       2 2000-02-01       19  -0.133  1.36  0.986 
       3 2000-03-01       25 -18.1    1.24  0.934 
       4 2000-04-01       74 -37.7    1.05  0.797 
       5 2000-05-01      145 -45.9    1.15  0.637 
       6 2000-06-01       59 -48.5    0.763 0.322 
       7 2000-07-01       67 -14.7    0.779 0.310 
       8 2000-08-01      174  56.4    0.980 0.476 
       9 2000-09-01      142 -10.3    0.747 0.0848
      10 2000-10-01      131 -15.2    0.272 0.138 
      # ... with 122 more rows
      # i Use `print(n = ...)` to see more rows
      

---

    Code
      .calc_precipitation_chirps(shp, chirps, engine = "extract")
    Output
      [[1]]
      # A tibble: 132 x 4
         dates      absolute anomaly   spi_3
         <date>        <dbl>   <dbl>   <dbl>
       1 2000-01-01        8  -3.1    2.46  
       2 2000-02-01       19  -0.133  0.0559
       3 2000-03-01       25 -18.1   -0.744 
       4 2000-04-01       74 -37.7   -1.30  
       5 2000-05-01      145 -45.9   -1.20  
       6 2000-06-01       59 -48.5   -1.56  
       7 2000-07-01       67 -14.7   -1.11  
       8 2000-08-01      174  56.4   -0.364 
       9 2000-09-01      142 -10.3    0.342 
      10 2000-10-01      131 -15.2    0.253 
      # ... with 122 more rows
      # i Use `print(n = ...)` to see more rows
      

---

    Code
      .calc_precipitation_chirps(shp, chirps, engine = "exactextract")
    Output
      [[1]]
      # A tibble: 132 x 4
         dates      absolute  anomaly   spi_3
         <date>        <dbl>    <dbl>   <dbl>
       1 2000-01-01     6.69  -2.62    2.48  
       2 2000-02-01    17.7   -0.0106  0.0536
       3 2000-03-01    23.2  -16.1    -0.734 
       4 2000-04-01    67.6  -34.3    -1.29  
       5 2000-05-01   135.   -43.6    -1.19  
       6 2000-06-01    56.7  -47.6    -1.57  
       7 2000-07-01    61.3  -12.9    -1.14  
       8 2000-08-01   155.    50.0    -0.403 
       9 2000-09-01   130.    -9.78    0.299 
      10 2000-10-01   120.   -18.8     0.164 
      # ... with 122 more rows
      # i Use `print(n = ...)` to see more rows
      

---

    Code
      .calc_precipitation_chirps(shp, chirps, scales_spi = c(12, 24), spi_prev_years = 3)
    Output
      [[1]]
      # A tibble: 192 x 5
         dates      absolute anomaly spi_12 spi_24
         <date>        <dbl>   <dbl>  <dbl>  <dbl>
       1 1985-01-01        7   -4.1  -0.647 -0.289
       2 1985-02-01       18   -1.13 -0.683 -0.284
       3 1985-03-01       31  -12.1  -0.875 -0.465
       4 1985-04-01       95  -16.7  -0.772 -0.467
       5 1985-05-01      185   -5.93 -0.392 -0.646
       6 1985-06-01       54  -53.5  -1.04  -0.742
       7 1985-07-01       92   10.3  -1.02  -0.663
       8 1985-08-01      152   34.4  -0.645 -0.452
       9 1985-09-01      185   32.7  -0.675 -0.270
      10 1985-10-01      176   29.8  -0.106 -0.486
      # ... with 182 more rows
      # i Use `print(n = ...)` to see more rows
      

