Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F9450C7B
	for <lists+linux-nfc@lfdr.de>; Mon, 15 Nov 2021 18:36:09 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E1275100EAB73;
	Mon, 15 Nov 2021 09:36:06 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C921B100F226A
	for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 09:36:04 -0800 (PST)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 687983F1A3
	for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636997762;
	bh=lsvr6cO6nVa1IlxQ84sCrAG5j7jBRl+0TlRjbaz6vyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=GB24OnA1etITyNQuafZ5oGjyNgNqWNsGzqigq2gVi1QPsyGjZYQzW23N840Q+Bq/P
	 ssVAvLUdBkUQVovryz5g+04nIpYXF2gY3P8XU3HOgrqzVhRqHWxHxi4COKsx478RWR
	 gPF/o69Up2VfV9Kzpl4xsZ3A+SnZZoqrMbXxQ1LtK+RB1m+L4IEXAVwV7ZhaHlzaJf
	 YNFgUneFIIe/mXGyuZtpH8UYEkCWqSB8T90ruJbse8H2RcrKXoE2wCit1BaGjbL+yC
	 8uP0R2VtT5KRKGimKGV8a8gGBLBsRIZlHmYox1vgAv8OZRkNk+n+2L5g3ZLn5ELn1q
	 e42VvBQf9G+Bw==
Received: by mail-lj1-f197.google.com with SMTP id u28-20020a2ea17c000000b0021126b5cca2so3505908ljl.19
        for <linux-nfc@lists.01.org>; Mon, 15 Nov 2021 09:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsvr6cO6nVa1IlxQ84sCrAG5j7jBRl+0TlRjbaz6vyo=;
        b=xSK2TRVW+1qlgT7UUX5jEXUlVLO3hyGnWZoUtMvEHrqgB3rwwZI48Dbqn+WfeDVU3b
         p/5tHZmjZVPrcnC217ZaCu+fbPlWLmPWsIHY4+oDWp+Cce2xileQKLHa4EWdHI21LdUj
         D4AZebbr3ROkqTew9UQz4drDdN7rf0MolVj/UGhlG1HJ3YTiE4g2J7R52SRIqAQ8CDaO
         JjyXv3xNRb1VwRePVb2rdbsbumSf1JYzVocJZv0zeP2Nl1fLv3jHUSZm+DBQ4pXqfnFm
         8ZR3pfbYlxitmMEZ2wMWRlJrqeESvZvoVEAIA4II9+cSvpOIpP4TAXwfEzOkqiHj51h0
         pEdw==
X-Gm-Message-State: AOAM533lbUqkgZ/kFYBLaFnXAzYNENOLNmDUuxvoU9WTWP4SSTpJ2JOC
	rUg8/1RwR8bpOqZ4djZ4bF8P5/QslPW/wAoAeTbBADYcbxePqmBekSr3CAFEffwIHkfqp9NXu7I
	9iAa82bEAeEDweUuYte6I34tWea3Oi3FOjQ==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr318804ljb.214.1636997761833;
        Mon, 15 Nov 2021 09:36:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrAcXM/QR7Ix1QfiAF7tVdS2EAEXVnovakAj0WFz02ziUG9LYHMHpDWqNeksz/bJFTZoagEA==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr318753ljb.214.1636997761330;
        Mon, 15 Nov 2021 09:36:01 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j16sm1484482lfe.4.2021.11.15.09.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 09:36:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: stable@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org
Date: Mon, 15 Nov 2021 18:35:51 +0100
Message-Id: <20211115173553.521371-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: YMSYAKMK7WAOMBMDHXPOMFC52QNLAHXZ
X-Message-ID-Hash: YMSYAKMK7WAOMBMDHXPOMFC52QNLAHXZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Lin Ma <linma@zju.edu.cn>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH stable v5.4+] NFC: add necessary privilege flags in netlink layer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YMSYAKMK7WAOMBMDHXPOMFC52QNLAHXZ/>
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/netlink.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 99b06a16b808..f8bfe068108e 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1672,31 +1672,37 @@ static const struct genl_ops nfc_genl_ops[] = {
 		.cmd = NFC_CMD_DEV_UP,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_dev_up,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEV_DOWN,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_dev_down,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_START_POLL,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_start_poll,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_STOP_POLL,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_stop_poll,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEP_LINK_UP,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_dep_link_up,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEP_LINK_DOWN,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_dep_link_down,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_GET_TARGET,
@@ -1713,26 +1719,31 @@ static const struct genl_ops nfc_genl_ops[] = {
 		.cmd = NFC_CMD_LLC_SET_PARAMS,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_llc_set_params,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_LLC_SDREQ,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_llc_sdreq,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_FW_DOWNLOAD,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_fw_download,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_ENABLE_SE,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_enable_se,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DISABLE_SE,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_disable_se,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_GET_SE,
@@ -1744,21 +1755,25 @@ static const struct genl_ops nfc_genl_ops[] = {
 		.cmd = NFC_CMD_SE_IO,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_se_io,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_ACTIVATE_TARGET,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_activate_target,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_VENDOR,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_vendor_cmd,
+		.flags = GENL_ADMIN_PERM,
 	},
 	{
 		.cmd = NFC_CMD_DEACTIVATE_TARGET,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nfc_genl_deactivate_target,
+		.flags = GENL_ADMIN_PERM,
 	},
 };
 
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
