Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5B450C7D
	for <lists+linux-nfc@lfdr.de>; Mon, 15 Nov 2021 18:36:09 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 013E5100EA917;
	Mon, 15 Nov 2021 09:36:08 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D3BDC100F226A
	for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 09:36:05 -0800 (PST)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D7A003F1BE
	for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636997763;
	bh=sSHlvzjDgVh9Uto9dko6m4S5PVvyzwrZ9CgGduFQPgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NJU6iKMagZzE4wkpRZxNVIrAlLOU9BKAuWjxuugDmDcRETLXbBBmJnhAqwIuSWWt/
	 sbLta+W3feiHXkq8xjWB2sAWTta38/cKMKGcE5BIgoYm6M2mZZnW/zwKWwZFWsjmV3
	 WmbVd8ejeijiPdMpVvFxX92NlDyXdHrkEWir500cxd731MZOcaPdz0DFIJF6qHbzL0
	 XLzT8pbSzSuSyzKio4zqqbcrDqc1vUVnGw/slE9kav/gv7gM5+MMJh2NAnrL+6pmVb
	 4q+M2ZVm1U82T7+eS0FSr/VIF9Q+CEzVjnZLJmuuYBU/aCDzCiXQs23vJJwnnedzAL
	 iBHGvdInnYFPg==
Received: by mail-lf1-f69.google.com with SMTP id b23-20020a0565120b9700b00403a044bfcdso5925205lfv.13
        for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 09:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sSHlvzjDgVh9Uto9dko6m4S5PVvyzwrZ9CgGduFQPgg=;
        b=slpfCCU93WsaM8fOBq3gh3RO42AWbdEt5yIFeiucZWi+CEx4kLVb7IeN2vaepaBN7z
         P3/M8pVti4KE0pclSWDlBgJWIH9BLd2Be33HW1EN5WzPhwpOKbabWK/e3/Y9snIEilPg
         mmkbnnVXdv/XPA3TG9PNzsiFhPHy9KyS32NwFoqnOyhCqXLmTDGtTR9NnhctMetS7SEh
         6LVqkRHarmVRtDX9NXX7Iby181kQlNk/x1NkHOCumR3Rh1VMqVyPRDfbezlyRv90Mk8+
         /ADmegvmTghRN1ddH2SFznoawx11lcaPoKMl9XTrgbMO/VgmN6FKDexN+ZAdzGFAqx4v
         B7pw==
X-Gm-Message-State: AOAM531E84xm0mt8G87TMFMqQBzBZDE4KQVEFA58hsqEn7psRmuVl3H4
	i03iN1KACkGxODX3P0oXqV58y27I8gZHAzbJVXJSg3DpLAfEn51oZlmYMtHpW7V/lToOu6yL1pt
	xp/QZizFl1v3B7wPnzBTGXaq1hSCE+ZEpuA==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr322948ljm.168.1636997763161;
        Mon, 15 Nov 2021 09:36:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0FLYumoSNg+UWemcSw2D1PWZawoN4Q6WRqAzI6ZvfLcZuxtmDxoIXkgcFNufDSMWGlmo64Q==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr322928ljm.168.1636997762995;
        Mon, 15 Nov 2021 09:36:02 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j16sm1484482lfe.4.2021.11.15.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 09:36:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: stable@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org
Date: Mon, 15 Nov 2021 18:35:52 +0100
Message-Id: <20211115173553.521371-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115173553.521371-1-krzysztof.kozlowski@canonical.com>
References: <20211115173553.521371-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 34JGBWBUYYNUNF4VUE4EB6XKMDMFA2M4
X-Message-ID-Hash: 34JGBWBUYYNUNF4VUE4EB6XKMDMFA2M4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Lin Ma <linma@zju.edu.cn>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH stable v4.4 - v4.14] NFC: add necessary privilege flags in netlink layer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/34JGBWBUYYNUNF4VUE4EB6XKMDMFA2M4/>
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

Please apply for v4.4, v4.9 and v4.14.

 net/nfc/netlink.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index c90dc2fd13a7..20ea14791a9d 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1639,31 +1639,37 @@ static const struct genl_ops nfc_genl_ops[] = {
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
@@ -1680,26 +1686,31 @@ static const struct genl_ops nfc_genl_ops[] = {
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
@@ -1711,16 +1722,19 @@ static const struct genl_ops nfc_genl_ops[] = {
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
 };
 
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
