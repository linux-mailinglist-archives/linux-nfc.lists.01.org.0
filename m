Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785A3EED64
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B4E2E100EB82E;
	Tue, 17 Aug 2021 06:28:56 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1FD64100EB826
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:55 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so2970557pje.0
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ZplN+DQNjy/fGTSwhmHuEQ65uOe/NIplIHGWhiFszo=;
        b=WvAyxJYInJUFXJ4QJrYKlFxGPar8wHEk8GoKa4cC8pk2RwtyHr3CGvO6XZxVmGoATF
         HYRGTWOGBKO13ow5rCLeVZ0koRfaofZd7zL52nSKpjkTW+IohzOGz4rK8Ve+XcYnAuKj
         kkNc0LARPhlFloFzpTqHCyuYaAbr5pyEYv498KwHzj0HWix6zkI0pjyIASxWx+V/L2SI
         co7rqsKc/mA9uqikoyzo9aTipBKpbamxJLDKkFFLaS+VPi5seMCcQoA2pwuKu/wzqipR
         QVp4N6/eEiIU3PqtKEUoQiBSyDfsQl2Ml4Bm/ELhkgKq8Nrt0AOj4PYPxAB19ua1OVN5
         W9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ZplN+DQNjy/fGTSwhmHuEQ65uOe/NIplIHGWhiFszo=;
        b=QETQgWfkycPXFvm3mJF2skabk0HI+piLcgz75KZ3OMWM5zQVRrFLKXbR6oa7BWNoz3
         e+ha/5mqvggndjjqH5trtJ8sAw1uhVSDjgnGjptZ83o77AcyVXf6SI6tTZqEEh5pdiy5
         VrlWdk8GdM4s+3TRg796zUy3Op/v+b7UscX+z63tFxL5HOvKlNYS+5cygQhkrQzcW/jU
         BWN110jX5Ui/roY7n3AjrX+IoIpZNnXHtg30JSZyQT7fcykDkTjQWe36y1rFet+24wn9
         d6XCTeiSgk6l1Q0jfXlSq1QqsMi8gKmPgpDO95eClQW0/Vmm7/KLWMEknTB5Ge1kmQJp
         JrrA==
X-Gm-Message-State: AOAM53031Es8Mx/1OwYJUj5PPozav+/Ug1KvZOcwmHPt5K1QOhagyyzN
	LN+0sEwcXmzO9eyetCjGoMA=
X-Google-Smtp-Source: ABdhPJwjs6ll+Fse/MhmD4u8giVOEOqjIV0lDGexqfHdKcTxeObEO4Vp83hluXRKeOsA9tfVz2S6pw==
X-Received: by 2002:a17:903:234e:b0:12d:ad8d:56c6 with SMTP id c14-20020a170903234e00b0012dad8d56c6mr2762205plh.23.1629206934900;
        Tue, 17 Aug 2021 06:28:54 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:54 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:17 -0700
Message-Id: <20210817132818.8275-8-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
References: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: B355DQVWA5THCX35NAMBXHBMAMBVIREZ
X-Message-ID-Hash: B355DQVWA5THCX35NAMBXHBMAMBVIREZ
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 7/8] selftests: nci: Extract the start/stop discovery function
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/B355DQVWA5THCX35NAMBXHBMAMBVIREZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

To reuse the start/stop discovery code in other testcase, extract the code.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 53 +++++++++++++++++++--------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 2b90379523c6..a68b14642c20 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -517,38 +517,61 @@ static void *virtual_poll_stop(void *data)
 	return (void *)-1;
 }
 
-TEST_F(NCI, start_poll)
+int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int pid)
 {
 	__u16 nla_start_poll_type[2] = {NFC_ATTR_DEVICE_INDEX,
 					 NFC_ATTR_PROTOCOLS};
-	void *nla_start_poll_data[2] = {&self->dev_idex, &self->proto};
+	void *nla_start_poll_data[2] = {&dev_idx, &proto};
 	int nla_start_poll_len[2] = {4, 4};
 	pthread_t thread_t;
 	int status;
 	int rc;
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_start,
-			    (void *)&self->virtual_nci_fd);
-	ASSERT_GT(rc, -1);
+			    (void *)&virtual_fd);
+	if (rc < 0)
+		return rc;
 
-	rc = send_cmd_mt_nla(self->sd, self->fid, self->pid, NFC_CMD_START_POLL, 2,
-			     nla_start_poll_type, nla_start_poll_data,
-			     nla_start_poll_len, NLM_F_REQUEST);
-	EXPECT_EQ(rc, 0);
+	rc = send_cmd_mt_nla(sd, fid, pid, NFC_CMD_START_POLL, 2, nla_start_poll_type,
+			     nla_start_poll_data, nla_start_poll_len, NLM_F_REQUEST);
+	if (rc != 0)
+		return rc;
 
 	pthread_join(thread_t, (void **)&status);
-	ASSERT_EQ(status, 0);
+	return status;
+}
+
+int stop_polling(int dev_idx, int virtual_fd, int sd, int fid, int pid)
+{
+	pthread_t thread_t;
+	int status;
+	int rc;
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_stop,
-			    (void *)&self->virtual_nci_fd);
-	ASSERT_GT(rc, -1);
+			    (void *)&virtual_fd);
+	if (rc < 0)
+		return rc;
 
-	rc = send_cmd_with_idx(self->sd, self->fid, self->pid,
-			       NFC_CMD_STOP_POLL, self->dev_idex);
-	EXPECT_EQ(rc, 0);
+	rc = send_cmd_with_idx(sd, fid, pid,
+			       NFC_CMD_STOP_POLL, dev_idx);
+	if (rc != 0)
+		return rc;
 
 	pthread_join(thread_t, (void **)&status);
-	ASSERT_EQ(status, 0);
+	return status;
+}
+
+TEST_F(NCI, start_poll)
+{
+	int status;
+
+	status = start_polling(self->dev_idex, self->proto, self->virtual_nci_fd,
+			       self->sd, self->fid, self->pid);
+	EXPECT_EQ(status, 0);
+
+	status = stop_polling(self->dev_idex, self->virtual_nci_fd, self->sd,
+			      self->fid, self->pid);
+	EXPECT_EQ(status, 0);
 }
 
 TEST_F(NCI, deinit)
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
