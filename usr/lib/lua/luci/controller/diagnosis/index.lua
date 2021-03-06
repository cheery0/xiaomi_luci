module("luci.controller.diagnosis.index", package.seeall)
function index()
    local root = node()
    if not root.target then
        root.target = alias("diagnosis")
        root.index = true
    end
    local page   = node("diagnosis")
    page.target  = firstchild()
    page.title   = _("")
    page.order   = 110
    page.sysauth = "admin"
    page.mediaurlbase = "/xiaoqiang/diagnosis"
    page.sysauth_authenticator = "htmlauth"
    page.index = true
    entry({"diagnosis"}, template("diagnosis/home"), _("首页"), 1, 0x09)

    entry({"diagnosis", "wanerr"}, call("action_wanerr"), _(""), 2, 0x09)
    entry({"diagnosis", "errindex"}, call("action_errindex"), _(""), 3, 0x09)
end

function action_wanerr()
    local result = {}
    result["code"] = 0
    result["data"] = {
        ["a"] = _("对不起，小米路由器出现网络连接问题无法打开网页"),
        ["b"] = _("1、请检查网线是否正确连接路由器WAN口上"),
        ["c"] = _("2、请检查网线是否损坏"),
        ["d"] = _("3、请检查路由器WAN口是否损坏"),
        ["e"] = _("小米路由器技术支持")
    }
    luci.http.write_json(result)
end

function action_errindex()
    local result = {}
    result["code"] = 0
    result["data"] = {
        ["a"] = _("对不起，小米路由器出现网络连接问题无法打开网页"),
        ["b"] = _("立即进行网络诊断"),
        ["c"] = _("小米路由器技术支持")
    }
    luci.http.write_json(result)
end