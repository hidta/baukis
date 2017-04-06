module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} - Baukis"
    else
      "Baukis"
    end
  end
  #present?はblank?の否定
  #blank?はクラスによって異なる
  #文字列の場合以下trueを返す
  #長さが０である
  #全ての文字列が空白文字の場合
  #配列の場合、要素数が０の場合trueをかえす

end
