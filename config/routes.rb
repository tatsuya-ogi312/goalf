Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :articles
  resources :users, only: :show do
    resources :golfers, only: [:index, :new, :create, :edit, :update]
  end
end

TECHCAMP 相談用フォーム
【開発中のアプリ】
・オリジナルアプリ：goalf

【出来ないこと・やりたいこと】
・ユーザーおが記事を投稿して、その記事がトップページに一覧として表示されます。
　またマイページを実装して、そのユーザーが投稿した記事の一覧を見れるようにしたいのですが
　User ,Articleテーブルのアクションでshowを使っているため、、新しくコントローラーを設けるべきか
既存のコントローラーで別のアクションを設けてパスを設定するかどちらがよろしいでしょうか。

【仮説・検証とその結果】
■ 調べた内容とそこから立てた「仮説」
・
・

■ 仮説を元に行った「検証」と「その結果」
・
・

【関連リンクの共有】
■ エラー画面のスクリーンショット
　URL：

■ 問題に関するコード全体のスクリーンショット
　URL：

■ 問題に関するターミナルやコンソールのスクリーンショット
　URL：

（※その他、相談する上で必要な情報があれば追加しましょう。 GitHubリポジトリのURLなど）
