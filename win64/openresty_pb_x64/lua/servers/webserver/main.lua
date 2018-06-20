--
-- Author: jgao
-- Date: 2016-08-10 15:36:46
--

local a = package.loadlib("pb.dll", "luaopen_pb");
a()

require "servers.webserver.Person_pb"
local msg = Person_pb.Person()
msg.id = 100
msg.name = "foo"
msg.email = "bar"
local pb_data = msg:SerializeToString()
ngx.say("create:")
ngx.say(pb_data)

local msg = Person_pb.Person()
msg:ParseFromString(pb_data)
ngx.say("parser:")
ngx.say(msg.id)