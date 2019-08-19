# FlickrDemoApp

<img width="207" height="448" src="https://github.com/alantin918/FlickrDemoApp/blob/master/Simulator1.png">/
<img width="207" height="448" src="https://github.com/alantin918/FlickrDemoApp/blob/master/Simulator2.png">/
<img width="207" height="448" src="https://github.com/alantin918/FlickrDemoApp/blob/master/Simulator3.png">/

第一頁：搜尋輸入頁
有兩個輸入框，1.搜尋的輸入匡(Text) 2.每頁要呈現的數量的輸入匡(Per Page)
要兩個輸入框都有輸入文字才可以按button(以顏色區別)

第二頁：搜尋結果頁
兩個輸入框改變flickr做API Request，
可無限滑動，會顯示圖片與標題。

進入搜尋結果頁後，出現tabbar(製作navigationbar，按"搜尋輸入頁"回上一頁，tabbar會消失。)

cell可加入收藏的功能存至本地端(存至NSHomeDirectory()，再將本地的圖片讀取出來。)

tabbar另一個分頁：我的最愛
加入收藏後，可以看到該圖片顯示，
重開之後依然可以看到圖片顯示。
