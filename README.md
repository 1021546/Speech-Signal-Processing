# Speech-Signal-Processing

## Pitch Contour
    - 因為當比較 Autocorrelation 的 x(m) 和 x(m+k) 兩者剛好吻合時，所得到的 peak 值為最大，代表此時為週期
      每隔一段週期，就可以得到最大的 peak 值，所以找到最大的 peak 值 ，就可以得到週期
      最大的 peak 值的位置，對應到 x軸的 frame值，就是週期的值
      peak 有許多的點，每隔一段週期，就得到相對的週期，可以只取第一個 peak 的位置，或是把其它 peak 的相對位置相加再平均
      
      pitch = audioInfo.SampleRate/peak = audioInfo.SampleRate/週期 = 有幾個週期 = Frequent;
## Autocorrelation
   - Autocorrelation 的 x(m) 和 x(m+k) 兩者相乘，越往後，相乘的數量越少，所得到的值也越小，只有在 x(m) 和 x(m+k) 兩者剛好吻合時(週期相同，圖形相   
   同)，所得到的 peak 值最大
