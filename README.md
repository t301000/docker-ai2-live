# docker-ai2-live

可用來建立 App Inventor 2 離線版之 docker container，須配合 [AiLiveComplete](http://sourceforge.net/projects/ailivecomplete/) 使用。

## 建立 image

```bash
git clone https://github.com/t301000/docker-ai2-live.git
cd docker-ai2-live
docker build -t IMAGE_NAME[:TAG] .
```

#### 範例

建立名稱為 ai2-live 的 image，其 tag 為 v1
```bash
docker build -t ai2-live:v1 .
```

---
## 建立 container

### 準備工作：
1. 下載 [AiLiveComplete](http://sourceforge.net/projects/ailivecomplete/files/?source=navbar)
2. 將下載的檔案解壓縮，解壓縮出來的資料夾名稱為 Ai2LiveComplete
3. 修改 Ai2LiveComplete 下的 startAIServer.sh
```bash
找到：
java -ea -cp "$JAR_FILE" \
  com.google.appengine.tools.KickStart \
  com.google.appengine.tools.development.DevAppServerMain "$@" $WEB_APP
```

```bash
改成：（最後加入 & ，丟到背景執行）
java -ea -cp "$JAR_FILE" \
  com.google.appengine.tools.KickStart \
  com.google.appengine.tools.development.DevAppServerMain "$@" $WEB_APP &
```

### 建立 container

先將路徑切換到 Ai2LiveComplete 所在目錄，執行以下指令：

```bash
docker run -d --name=ai2_live -p 8888:8888 -v $(pwd)/Ai2LiveComplete:/ai2 ai2-live:v1
```

使用之 image 為 ai2-live， tag 為 v1， container 命名為 ai2_live，將目前路徑下的 Ai2LiveComplete 掛載到 container 中的 /ai2

瀏覽 localhost:8888 或是 ip:8888 即可開始使用囉！！

