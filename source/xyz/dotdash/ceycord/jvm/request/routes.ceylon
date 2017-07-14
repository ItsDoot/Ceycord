shared object routes {

    shared object users {

        shared Route<[String]> get = rGet((String uId) => "users/``uId``");

        shared object profile {

            shared Route<[String]> get = rGet((String uId) => "users/``uId``/profile");
        }
    }

    shared object guilds {

        shared Route<[String]> get = rGet((String gId) => "guilds/``gId``");
        shared Route<[String]> modify = rPatch((String gId) => "guilds/``gId``");

        shared Route<> create = rPost(() => "guilds");
        shared Route<[String]> delete = rPost((String guildId) => "guilds/``guildId``/delete");
        shared Route<[String]> ack = rPost((String guildId) => "guilds/``guildId``/ack");

        shared object bans {

            shared Route<[String]> get = rGet((String gId) => "guilds/``gId``/bans");

            shared Route<[String, String, String? =, Integer? =]> ban = rPut {
                function apply(String guildId, String userId, String? reason = null, Integer? days = null) {
                    StringBuilder builder = StringBuilder();

                    builder.append("guilds/``guildId``/bans/``userId``");

                    if (exists days) {
                        builder.append("?delete-message-days=``days``");

                        if (exists reason) {
                            builder.append("&reason=``reason``");
                        }
                    } else if (exists reason) {
                        builder.append("?reason=``reason``");
                    }

                    return builder.string;
                }
            };
            shared Route<String[2]> unban = rDelete((String gId, String uId) => "guilds/``gId``/bans/``uId``");
        }

        shared object channels {
            
            String channels(String guildId) => "guilds/``guildId``/channels"; 

            shared Route<[String]> create = rPost(channels);
            shared Route<[String]> get = rGet(channels);
            shared Route<[String]> modify = rPatch(channels);
        }

        shared object emotes {

            shared Route<[String, String]> modify = rPatch((String guildId, String emoteId) {
                return "guilds/``guildId``/emojis/``emoteId``";
            });
            shared Route<[String, String]> delete = rDelete((String guildId, String emoteId) {
                return "guilds/``guildId``/emojis/``emoteId``";
            });
            shared Route<[String]> create = rPost((String guildId) => "guilds/``guildId``/emojis");
        }

        shared object members {

            shared Route<[String, String, String? =]> kickReason = rDelete {
                function apply(String guildId, String userId, String? reason = null) {
                    StringBuilder builder = StringBuilder();

                    builder.append("guilds/``guildId``/members/``userId``");

                    if (exists reason) {
                        builder.append("?reason=``reason``");
                    }

                    return builder.string;
                }
            };
            shared Route<String[2]> modify = rPatch((String gId, String uId) => "guilds/``gId``/members/``uId``");
            shared Route<[String]> modifySelfNick = rPatch((String gId) => "guilds/``gId``/members/@me/nick");
        }

        shared object prune {

            shared Route<[String, Integer]> count = rGet((String gId, Integer days) => "guilds/``gId``/prune?days=``days``");
            shared Route<[String, Integer]> start = rPost((String gId, Integer days) => "guilds/``gId``/prune?days=``days``");
        }

        shared object roles {
            
            String roles(String guildId) => "guilds/``guildId``/roles";

            shared Route<[String]> get = rGet(roles);
            shared Route<[String]> modify = rPatch(roles);
            shared Route<[String]> create = rPost(roles);
            
            String role(String guildId, String roleId) => "guilds/``guildId``/roles/``roleId``";

            shared Route<[String, String]> getOne = rGet(role);
            shared Route<[String, String]> modifyOne = rPatch(role);
            shared Route<[String, String]> deleteOne = rDelete(role);
        }
    }
    
    shared object channels {
        
        shared Route<[String]> delete = rDelete((String channelId) => "channels/``channelId``");
        shared Route<[String]> modify = rPatch((String channelId) => "channels/``channelId``");
        shared Route<[String]> sendTyping = rPost((String channelId) => "channels/``channelId``/typing");

        shared object call {

            shared Route<[String]> start = rPost((String channelId) => "channels/``channelId``/call/ring");
            shared Route<[String]> stop = rPost((String channelId) => "channels/``channelId``/call/stop_ringing");
        }

        shared object messages {

            shared Route<[String]> send = rPost((String channelId) => "channels/``channelId``/messages");

            String message(String channelId, String messageId) => "channels/``channelId``/messages/``messageId``";

            shared Route<[String, String]> edit = rPatch(message);
            shared Route<[String, String]> delete = rDelete(message);
        }

        shared object permissions {

            shared Route<[String]> get = rGet((String channelId) => "channels/``channelId``/permissions");

            String override(String channelId, String overrideId) => "channels/``channelId``/permissions/``overrideId``";

            shared Route<[String, String]> getOverride = rGet(override);
            shared Route<[String, String]> createOverride = rPut(override);
            shared Route<[String, String]> modifyOverride = rPut(override);
            shared Route<[String, String]> deleteOverride = rDelete(override);
        }

        shared object pins {

            shared Route<[String]> get = rGet((String channelId) => "channels/``channelId``/pins");

            String pin(String channelId, String messageId) => "channels/``channelId``/pins/``messageId``";

            shared Route<[String, String]> add = rPut(pin);
            shared Route<[String, String]> remove = rDelete(pin);
        }

        shared object recipients {

            shared Route<[String]> get = rGet((String channelId) => "channels/``channelId``/recipients");

            String recipient(String channelId, String userId) => "channels/``channelId``/recipients/``userId``";

            shared Route<[String, String]> getOne = rGet(recipient);
            shared Route<[String, String]> addOne = rPut(recipient);
            shared Route<[String, String]> removeOne = rDelete(recipient);
        }

        shared object webhooks {

            shared Route<[String]> get = rGet((String channelId) => "channels/``channelId``/webhooks");
            shared Route<[String]> create = rPost((String channelId) => "channels/``channelId``/webhooks");
        }
    }

    shared object gateway {

        shared Route<> get = rGet(() => "/gateway");

        shared object bot {

            shared Route<> get = rGet(() => "/gateway/bot");
        }
    }
}