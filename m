Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 154523EED60
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:56 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A0FC3100EB829;
	Tue, 17 Aug 2021 06:28:54 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 06C56100EB831
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:52 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so5213634pjr.1
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZI4oJnKj5qvjjBmjelGVqMD99NjqyWcYOyrmYvbCn0=;
        b=SkOmSmFgTNdohK/Z3uE76cxQ2/8GzO5KOapBc29FVK6JcjtoLpeHmErkQ7cG3FH2oM
         +U1nY+DcMYWbpwJZwRQg3IM+BRxBUe1Zkl8Rr1vqBaFUzz7D/C2WM/C2c+VZOcrCgOCy
         W867GXKCaOWHJMwM+qeG8rMwJ/5c5JHfvPk+hQ3YEDoJHcm35XYZlLfZVU4diA+IdMUd
         2ti+RMl/7fGQIj1hRm+iXGhF5mAKhZT/FR8G7Qsk2JP3CsJhJ5HODBhUOKl6q247PhU0
         i6AXWQ6Tcf/DYl9vyM0n8Lp84m2Ohm/JySnXqlSACXKMe71NkhPt9qTbbtAiopZoqtqx
         GagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZI4oJnKj5qvjjBmjelGVqMD99NjqyWcYOyrmYvbCn0=;
        b=Daw9Z9y4wpearLigfsHDXQZnGTlvNOORv7WfwvN7A3/oHTHoypyRCoyRfsi8B4vEIh
         qTkcKBejDLFAkeLddahw2ZsCJIBihdoHNmUw2d1xnrEwxEAUh8K4miLwKJjVGAmSzfJh
         qesu3sL5fT6f7UmvXa1zSxWHRObiQMUNXo1ye0f+qEp4sXNlUlkhNIB20FNpjLbZ/ssX
         HZ1u6rJRaNitWqnPHo7JtP7TjfVHtZ35wa+2S/lpxbC1UN9XMkcQbnNOAk1bBf2yo2jc
         8r44Kc7DFBAJ6ltkgh6veupB+iXPfSDfv0OpdB7RZCMf94hb4t3+2ocwg83BPkVQNNJ0
         TPqw==
X-Gm-Message-State: AOAM533hwN6K+zNA6NsKDLvEkpDRLmzn/lga3pfMOHIdJM/8YaCntSon
	vAFmCyAc2OCZgf0CQP82HtE=
X-Google-Smtp-Source: ABdhPJxF8f/JsOvBsGtpYIepsMpvExDz1ljnvHLqlSvqqb7eGGVgtwtRV09BWibrazIj9KWe3mVj/Q==
X-Received: by 2002:aa7:900e:0:b0:3e1:3dfe:bb2b with SMTP id m14-20020aa7900e000000b003e13dfebb2bmr3685459pfo.81.1629206931825;
        Tue, 17 Aug 2021 06:28:51 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:51 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:16 -0700
Message-Id: <20210817132818.8275-7-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
References: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: 353QWLKZYPW52EQURJFGOJPDGXFCMM3U
X-Message-ID-Hash: 353QWLKZYPW52EQURJFGOJPDGXFCMM3U
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 6/8] selftests: nci: Add the flags parameter for the send_cmd_mt_nla
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/353QWLKZYPW52EQURJFGOJPDGXFCMM3U/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

To reuse the send_cmd_mt_nla for NLM_F_REQUEST and NLM_F_DUMP flag,
add the flags parameter to the function.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index a1786cef73bc..2b90379523c6 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -87,7 +87,7 @@ static int create_nl_socket(void)
 
 static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
 			   __u8 genl_cmd, int nla_num, __u16 nla_type[],
-			   void *nla_data[], int nla_len[])
+			   void *nla_data[], int nla_len[], __u16 flags)
 {
 	struct sockaddr_nl nladdr;
 	struct msgtemplate msg;
@@ -98,7 +98,7 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
 
 	msg.n.nlmsg_len = NLMSG_LENGTH(GENL_HDRLEN);
 	msg.n.nlmsg_type = nlmsg_type;
-	msg.n.nlmsg_flags = NLM_F_REQUEST;
+	msg.n.nlmsg_flags = flags;
 	msg.n.nlmsg_seq = 0;
 	msg.n.nlmsg_pid = nlmsg_pid;
 	msg.g.cmd = genl_cmd;
@@ -146,8 +146,8 @@ static int send_get_nfc_family(int sd, __u32 pid)
 	nla_get_family_data = family_name;
 
 	return send_cmd_mt_nla(sd, GENL_ID_CTRL, pid, CTRL_CMD_GETFAMILY,
-				1, &nla_get_family_type,
-				&nla_get_family_data, &nla_get_family_len);
+				1, &nla_get_family_type, &nla_get_family_data,
+				&nla_get_family_len, NLM_F_REQUEST);
 }
 
 static int get_family_id(int sd, __u32 pid)
@@ -189,7 +189,7 @@ static int send_cmd_with_idx(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
 	int nla_len = 4;
 
 	return send_cmd_mt_nla(sd, nlmsg_type, nlmsg_pid, genl_cmd, 1,
-				&nla_type, &nla_data, &nla_len);
+				&nla_type, &nla_data, &nla_len, NLM_F_REQUEST);
 }
 
 static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id, struct msgtemplate *msg)
@@ -531,9 +531,9 @@ TEST_F(NCI, start_poll)
 			    (void *)&self->virtual_nci_fd);
 	ASSERT_GT(rc, -1);
 
-	rc = send_cmd_mt_nla(self->sd, self->fid, self->pid,
-			     NFC_CMD_START_POLL, 2, nla_start_poll_type,
-			     nla_start_poll_data, nla_start_poll_len);
+	rc = send_cmd_mt_nla(self->sd, self->fid, self->pid, NFC_CMD_START_POLL, 2,
+			     nla_start_poll_type, nla_start_poll_data,
+			     nla_start_poll_len, NLM_F_REQUEST);
 	EXPECT_EQ(rc, 0);
 
 	pthread_join(thread_t, (void **)&status);
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
