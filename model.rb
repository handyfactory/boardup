#1. DB 생성
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/board.db")

#2. Table 생성
class Post
    include DataMapper::Resource
    property :id, Serial #공통
    property :title, String
    property :content, Text
    property :created_at, DateTime
end

class Blog
    include DataMapper::Resource
    property :id, Serial #공통
    property :title, String
    property :content, Text
    property :tag, String
    property :image_url, Text
    property :created_at, DateTime
end

class Journal
    include DataMapper::Resource
    property :id, Serial
    property :created_at, DateTime
    property :feeling, String
    property :weather, String
end

#3. DB안 Table 에 대한 정보를 바탕으로, 최종적으로 확정하고

DataMapper.finalize
#4. 각 테이블을 자동으로 업글한다

Post.auto_upgrade!
Blog.auto_upgrade!