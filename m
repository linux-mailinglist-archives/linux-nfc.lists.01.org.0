Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B563450C7E
	for <lists+linux-nfc@lfdr.de>; Mon, 15 Nov 2021 18:36:11 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 124D0100EA12D;
	Mon, 15 Nov 2021 09:36:09 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A0559100F226A
	for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 09:36:06 -0800 (PST)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8BF9B3F1A2
	for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 17:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636997765;
	bh=dfYDd/6xm1yuf2mOxsmph0kUT7UaWJ315LdSD7iOcYk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=HALQOZqqnPj7kUA0UbWCFxhwoinKltW5C8RJFSgnvreE1Fwq1w8BMg2djqO2qX+am
	 axjUiwULkQ4CnR9CmwNhs4VCWTebx1GMA7cGKsrz5zzaK0pPxHRr8l68ZMIzvdrHMU
	 zr/Agiqn3Vrwj5Rj7dJCbDJGkAhtwh/iorpCy5rYpDTM2ooEJz/iFeOg715BP5wefp
	 pi1+uGg9jbxS+gl1NiPJfFrW61PyBpy2f48i6HLfNPuwMT6XJAr79Q+5Pa6C6ac9YJ
	 zfoAfNxf6WlrZy4wbH6fTwx7Z1/0Q4xHQ3iwQV3pnB4/mnJJfQ5Wa5NEmgcIvR72jI
	 F5LWc4iOQgZ6A==
Received: by mail-lf1-f70.google.com with SMTP id i1-20020a056512318100b003ffd4e89eb9so7013058lfe.19
        for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 09:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfYDd/6xm1yuf2mOxsmph0kUT7UaWJ315LdSD7iOcYk=;
        b=oTz15Q92+MKDSalEK6cvZMKJrklnZxabE4hwFwbavc1u/LdzsmjEW03+VwMnirtlpl
         6NcFyZ6zg1vnVfdmZuTfDRktXXIi/yyfY+ZuVtBaDreS4fKj9HdLELr2S88yDAXt/t2R
         ffYO64HzzGFmHKa5Y+qzKSaJELQj9VtNHvoHUTvMxVPjoKmc4+5Hu/cPUDZzhaiKZfsG
         r4gMf1Phl7NlOCPrMeuchYio/poFXdXVFVGh8d2eUrZari3FCbMtz5tB3X279KJ+O1nj
         /RCxjt4GNMWhAtUEcMuHlrWtgH1Y0VtD4NIol3ZskkANvLf7teR37t/brAbACI/FeSOZ
         pQOQ==
X-Gm-Message-State: AOAM531wyO9/DHXcO+8GMwbaGFntgKy8U3kZlGpu7KCp1Z84eEUU22/T
	o0iMlcvW78YGgPcIbXpC35uRU5wfoxBk5GEdYd2g/zgeUbwaaZgzd7M/WGeFZTCRrIlqBiW/WTx
	I8G1dq1HnKWJSrdiK8DXzzxc6ZKhWWWrSlg==
X-Received: by 2002:a05:651c:98a:: with SMTP id b10mr305193ljq.346.1636997764827;
        Mon, 15 Nov 2021 09:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBwm0qqrefbL+0+n0YjV8w6LuTbGwscnRAn0CGFQ6U+LekRFFYvQkbIl02Zf5BEoUyIZuCiA==
X-Received: by 2002:a05:651c:98a:: with SMTP id b10mr305159ljq.346.1636997764635;
        Mon, 15 Nov 2021 09:36:04 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j16sm1484482lfe.4.2021.11.15.09.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 09:36:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: stable@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org
Date: Mon, 15 Nov 2021 18:35:53 +0100
Message-Id: <20211115173553.521371-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115173553.521371-1-krzysztof.kozlowski@canonical.com>
References: <20211115173553.521371-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZNMTS33DD24OREVJCB6MCIVG2X7TN2XW
X-Message-ID-Hash: ZNMTS33DD24OREVJCB6MCIVG2X7TN2XW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Lin Ma <linma@zju.edu.cn>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH stable v4.19] NFC: add necessary privilege flags in netlink layer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZNMTS33DD24OREVJCB6MCIVG2X7TN2XW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lin Ma <linma@zju.edu.cn>

commit aedddb4e45b34426cfbfa84454b6f203712733c5 upstream.

The CAP_NET_ADMIN checks are needed to prevent attackers faking a
device under NCIUARTSETDRIVER and exploit privileged commands.

This patch add GENL_ADMIN_PERM flags in genl_ops to fulfill the check.
Except for commands like NFC_CMD_GET_DEVICE, NFC_CMD_GET_TARGET,
NFC_CMD_LLC_GET_PARAMS, and NFC_CMD_GET_SE, which are mainly information-
read operations.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
Signed-off-by: David S. Miller <davem@davemloft.net>
[krzysztof: context changes and backport]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/netlink.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 4884e1987562..113250946e05 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1682,31 +1682,37 @@ static const struct genl_ops nfc_genl_ops[] = {
 		.cmd = NFC_CMD_DEV_UP,
 		.doit = nfc_genl_dev_up,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEV_DOWN,
 		.doit = nfc_genl_dev_down,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_START_POLL,
 		.doit = nfc_genl_start_poll,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_STOP_POLL,
 		.doit = nfc_genl_stop_poll,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEP_LINK_UP,
 		.doit = nfc_genl_dep_link_up,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEP_LINK_DOWN,
 		.doit = nfc_genl_dep_link_down,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_GET_TARGET,
@@ -1723,26 +1729,31 @@ static const struct genl_ops nfc_genl_ops[] = {
 		.cmd = NFC_CMD_LLC_SET_PARAMS,
 		.doit = nfc_genl_llc_set_params,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_LLC_SDREQ,
 		.doit = nfc_genl_llc_sdreq,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_FW_DOWNLOAD,
 		.doit = nfc_genl_fw_download,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_ENABLE_SE,
 		.doit = nfc_genl_enable_se,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DISABLE_SE,
 		.doit = nfc_genl_disable_se,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_GET_SE,
@@ -1754,21 +1765,25 @@ static const struct genl_ops nfc_genl_ops[] = {
 		.cmd = NFC_CMD_SE_IO,
 		.doit = nfc_genl_se_io,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_ACTIVATE_TARGET,
 		.doit = nfc_genl_activate_target,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_VENDOR,
 		.doit = nfc_genl_vendor_cmd,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEACTIVATE_TARGET,
 		.doit = nfc_genl_deactivate_target,
 		.policy = nfc_genl_policy,
+		.flags = GENL_ADMIN_PERM,
 	},
 };
 
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
