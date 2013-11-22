class WeiboShare
  constructor: ->
    @share_content  = $('.share_content').text()
    @appkey         = $('.share_appkey').text()
    @weibo_uid      = $('.share_weibo_uid').text()

    @width          = 100;
    @height         = 59;

  get_share_url: ->
    @params =
      url: location.href
      type: '5'
      count: '1'
      appkey: @appkey
      title: @share_content
      pic: ''
      ralateUid: @weibo_uid
      language: 'zh_cn'
      rnd: new Date().valueOf()

    params_str = (this.generate_params_part(key) for key of @params).join('&')
    url = "http://hits.sinajs.cn/A1/weiboshare.html?#{params_str}"
  
  generate_params_part: (key) ->
    "#{key}=#{@params[key]}"

  @generate_share_iframe: ->
    share = new WeiboShare
    url = share.get_share_url()
    iframe_url = '<iframe allowTransparency="true" frameborder="0" scrolling="no" src="'+url+'"></iframe>'
    
    $('.weibo_share').html(iframe_url)


WeiboShare.generate_share_iframe()