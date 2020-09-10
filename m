Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A926496E
	for <lists+linux-nfc@lfdr.de>; Thu, 10 Sep 2020 18:12:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B96D61426341C;
	Thu, 10 Sep 2020 09:12:52 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DA7BB141A76EE
	for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 09:12:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B991A21D79;
	Thu, 10 Sep 2020 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599754370;
	bh=jHH/wPFyXijfn4qbxAJDIqeZ9sIT7sZEqBqRbDpc3/A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qk1/iZx66lsXxLsmC2V4WzgjUe+CyIlaK9/HXYcgdgQ/TbuzMlIM73Ba66GLi5CTy
	 9Ggn5FVeGNBHmi1mMqhxN0bJiIfBLFllDWQHgfSk/caOcqo8cZ/HftJE/uhlSjGR7y
	 fg9WOHc2MIk/LadzvUOQf66mFYQiXkSIcQ6vqqMY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu, 10 Sep 2020 18:12:17 +0200
Message-Id: <20200910161219.6237-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
References: <20200910161219.6237-1-krzk@kernel.org>
Message-ID-Hash: A7RWPZOSRQOVZM7KNF67ELWJWH6MBAYC
X-Message-ID-Hash: A7RWPZOSRQOVZM7KNF67ELWJWH6MBAYC
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 6/8] nfc: s3fwrn5: Constify s3fwrn5_fw_info when not modified
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/A7RWPZOSRQOVZM7KNF67ELWJWH6MBAYC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Two functions accept pointer to struct s3fwrn5_fw_info but do not
modify the contents.  Make them const so the code is a little bit safer.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/firmware.c | 4 ++--
 drivers/nfc/s3fwrn5/firmware.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 69857f080704..ec930ee2c847 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -348,7 +348,7 @@ static int s3fwrn5_fw_get_base_addr(
 }
 
 static inline bool
-s3fwrn5_fw_is_custom(struct s3fwrn5_fw_cmd_get_bootinfo_rsp *bootinfo)
+s3fwrn5_fw_is_custom(const struct s3fwrn5_fw_cmd_get_bootinfo_rsp *bootinfo)
 {
 	return !!bootinfo->hw_version[2];
 }
@@ -399,7 +399,7 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 	return ret;
 }
 
-bool s3fwrn5_fw_check_version(struct s3fwrn5_fw_info *fw_info, u32 version)
+bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 version)
 {
 	struct s3fwrn5_fw_version *new = (void *) &fw_info->fw.version;
 	struct s3fwrn5_fw_version *old = (void *) &version;
diff --git a/drivers/nfc/s3fwrn5/firmware.h b/drivers/nfc/s3fwrn5/firmware.h
index cf1a83a5a525..3c83e6730d30 100644
--- a/drivers/nfc/s3fwrn5/firmware.h
+++ b/drivers/nfc/s3fwrn5/firmware.h
@@ -91,7 +91,7 @@ struct s3fwrn5_fw_info {
 
 void s3fwrn5_fw_init(struct s3fwrn5_fw_info *fw_info, const char *fw_name);
 int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info);
-bool s3fwrn5_fw_check_version(struct s3fwrn5_fw_info *fw_info, u32 version);
+bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 version);
 int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info);
 void s3fwrn5_fw_cleanup(struct s3fwrn5_fw_info *fw_info);
 
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
