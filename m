Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8433EED5D
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 694AE100EB826;
	Tue, 17 Aug 2021 06:28:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0B886100EBB78
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:43 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id bo18so32165002pjb.0
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mDYDzAJgI3Yi2xQjA7+jur2uQaZxHW2DQmLX7dH4FJA=;
        b=ZRfwhdThkpHil8wPYbDEHSMqGHAjaU05qSU1QcZwvJqnvFT86ZH4tSOFBhmWxUxpJ4
         M2A2WDV2LJsXFowLtBJ/IC5eLUgGABrwMaMcuMelH1h1gjzVcJ3988n596IjuCiOdgO8
         4N6iXxmnqInZiMYnPJ+37t4PCGhgX9JfUcktZ9Z3zS68DFn8sYsGZml838yRXOxI0ZJZ
         FKqhMhKnpSiyEvCoyVoYWyhfYPs6Rc4GJxB05CXe6hATkizB2LpylovUYcszWzYNczRb
         nR0i4xU3uYWRmxwS6cnQLVII1EqE/x045U/Im1e+EHVfVcgh3SJgMosmdg9JJTf0Fh7h
         Z0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mDYDzAJgI3Yi2xQjA7+jur2uQaZxHW2DQmLX7dH4FJA=;
        b=bgij2WHTWYZY5BN6R6XosPCCj0WyV0Qp55PvjVWKbe0nPOsuZyo6852SYOafrJCOFT
         yEB+ZXhhmMVaQXIs7Z5Vfmkl1tLhfa2hGsQ1LJQi+XFVhAy3zNNyqCiNnRLkQrK31ALg
         oub/UUTz9kYb7mLpDNFOoMU2SUybIhwg76OV1KKQmPsF1xwjgoUiLhT8ZTqnbVv2NCaP
         /cb+wo2TzkPhcP1IUSrH5uM/F9SkCl45AIr6Yfs8ZGJ1lyJy2o3JXzXOrk15ciSTRkkY
         S1Q1uyvPhIEDUvw5QecQK8Mwv1BUNrtiBF4kn8feg5AHywQvipChdmwTstgcXKVYtxp+
         UOMQ==
X-Gm-Message-State: AOAM5316/QFzQlY27t2pBycOh6DnRyKVK0US3dZU6vMdg5y8/zujzz4v
	D/3wd+Zmij2eUVEixlr9a/8=
X-Google-Smtp-Source: ABdhPJyxp1rkPoXeG1+USxftO2aGlLEy3fWxCsE4QPFrhEpsvASwGV5LDchuDdsQmVV0Hdz0cEm8LQ==
X-Received: by 2002:a63:20f:: with SMTP id 15mr3439266pgc.319.1629206922822;
        Tue, 17 Aug 2021 06:28:42 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:42 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:13 -0700
Message-Id: <20210817132818.8275-4-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
References: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: YVFE5VPTHU5VA4CGJOYP4XUHCJ3WGNUA
X-Message-ID-Hash: YVFE5VPTHU5VA4CGJOYP4XUHCJ3WGNUA
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 3/8] selftests: nci: Fix the typo
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YVFE5VPTHU5VA4CGJOYP4XUHCJ3WGNUA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Fix typo: rep_len -> resp_len

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 34e76c7fa1fe..b4d85eeb5fd1 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -158,7 +158,7 @@ static int get_family_id(int sd, __u32 pid)
 		char buf[512];
 	} ans;
 	struct nlattr *na;
-	int rep_len;
+	int resp_len;
 	__u16 id;
 	int rc;
 
@@ -167,10 +167,10 @@ static int get_family_id(int sd, __u32 pid)
 	if (rc < 0)
 		return 0;
 
-	rep_len = recv(sd, &ans, sizeof(ans), 0);
+	resp_len = recv(sd, &ans, sizeof(ans), 0);
 
-	if (ans.n.nlmsg_type == NLMSG_ERROR || rep_len < 0 ||
-	    !NLMSG_OK(&ans.n, rep_len))
+	if (ans.n.nlmsg_type == NLMSG_ERROR || resp_len < 0 ||
+	    !NLMSG_OK(&ans.n, resp_len))
 		return 0;
 
 	na = (struct nlattr *)GENLMSG_DATA(&ans);
@@ -194,7 +194,7 @@ static int send_cmd_with_idx(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
 
 static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id, struct msgtemplate *msg)
 {
-	int rc, rep_len;
+	int rc, resp_len;
 
 	rc = send_cmd_with_idx(sd, fid, pid, NFC_CMD_GET_DEVICE, dev_id);
 	if (rc < 0) {
@@ -202,14 +202,14 @@ static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id, struct msgtem
 		goto error;
 	}
 
-	rep_len = recv(sd, msg, sizeof(*msg), 0);
-	if (rep_len < 0) {
+	resp_len = recv(sd, msg, sizeof(*msg), 0);
+	if (resp_len < 0) {
 		rc = -2;
 		goto error;
 	}
 
 	if (msg->n.nlmsg_type == NLMSG_ERROR ||
-	    !NLMSG_OK(&msg->n, rep_len)) {
+	    !NLMSG_OK(&msg->n, resp_len)) {
 		rc = -3;
 		goto error;
 	}
@@ -222,21 +222,21 @@ static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id, struct msgtem
 static __u8 get_dev_enable_state(struct msgtemplate *msg)
 {
 	struct nlattr *na;
-	int rep_len;
+	int resp_len;
 	int len;
 
-	rep_len = GENLMSG_PAYLOAD(&msg->n);
+	resp_len = GENLMSG_PAYLOAD(&msg->n);
 	na = (struct nlattr *)GENLMSG_DATA(msg);
 	len = 0;
 
-	while (len < rep_len) {
+	while (len < resp_len) {
 		len += NLA_ALIGN(na->nla_len);
 		if (na->nla_type == NFC_ATTR_DEVICE_POWERED)
 			return *(char *)NLA_DATA(na);
 		na = (struct nlattr *)(GENLMSG_DATA(msg) + len);
 	}
 
-	return rep_len;
+	return resp_len;
 }
 
 FIXTURE(NCI) {
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
