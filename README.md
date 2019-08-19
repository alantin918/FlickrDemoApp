# FlickrDemoApp

<img width="207" height="448" src="https://github.com/alantin918/FlickrDemoApp/blob/master/Simulator1.png">/
<img width="207" height="448" src="https://github.com/alantin918/FlickrDemoApp/blob/master/Simulator3.png">/
<img width="207" height="448" src="https://github.com/alantin918/FlickrDemoApp/blob/master/Simulator2.png">/

首頁：搜尋輸入頁
有兩個輸入框，1.搜尋的輸入匡(Text) 2.每頁要呈現的數量的輸入匡(Per Page)
要兩個輸入框都有輸入文字才可以按button(以顏色區別，灰色不能按，藍色可以按。)
輸入以prepare、segue傳值到下一頁

tabbar 第一分頁：搜尋結果頁
兩個輸入框改變flickr做API Request，再用URLSession、JSONDecoder來顯示圖片。
另外，可無限滑動，會顯示、標題："搜尋結果 + Text"以及可按"加入收藏"。
進入搜尋結果頁後，出現tabbar(實作navigationController，按"搜尋輸入頁"可回上一頁，tabbar會消失。)

tabbar 第二分頁：我的最愛
加入收藏後，可以看到該圖片顯示，
重開之後依然可以看到圖片顯示。
(圖片存至本地端NSHomeDirectory()，再將本地端的圖片讀取出來。)
