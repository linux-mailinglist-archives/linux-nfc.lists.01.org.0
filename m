Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C61ED428068
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 12:18:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0AE74100F227A;
	Sun, 10 Oct 2021 03:18:27 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 452FF100EC1EB
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 03:18:25 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 878753F2FF
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633861101;
	bh=819cRlsVNO79v7ICQu+D0OpZzx4PM/RPXaVTFQlQyKU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=LpFCUlGVyTtKjku9LKZLoK1/U/CxDGpjwBPIOQg8kWBs66qy+IEfvwLIjsNW9wHaS
	 oWKs3D+ubDgFEt1ug84EiHDvRg4212pCtrZUM5xiDRdDsExJ5S/77tiKVqFLoMsa3+
	 o8WXSiOv0uJTx3Znj/Md7B4tjwnnRaMHD441sJPrJ8IVHDKmj26XAUAKvwRvQyG0oi
	 Huy/T9PYJ0iQQB3SqcX/rOPqhwW+YnteKl9KewJk6J4n3wOmTH1vFjiOK8BrSrCkcK
	 QzgOj+N3G3FwbZ/aUYGvAjiutkv5NVzFOPazU47EIxcNpfIk33iG2lYG9bQtFpIT4o
	 AcPxVn8TC8mvw==
Received: by mail-ed1-f69.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso13139693edt.11
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 03:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=819cRlsVNO79v7ICQu+D0OpZzx4PM/RPXaVTFQlQyKU=;
        b=F6UTWdp7duR5BgFlTAGF0XjfMdf+fkQXm96pCjKhnxVfqRjfVDEwh7Hguf5YkNLBfK
         odDHPbvp7ko8l1rLOeWOwuwRHqS95YFd0XAhLomuR1LirJj1RX7kTtbvBd8MGRnfHWRk
         XZhgM2oW4LEKBpZSELLrOnpsgnWtG/qUgi+NK0H7hm/119VG2L0B2R4UB4tc5Q5OOQpj
         iA7I6YUMjU+dXHFuHLp521v4x1D+EuUdSwRdFmPW7PV3zSN4rdpy1lXlSpVQkGh8RqI8
         8qBNBh1OlCfUHNZckpAE4sKH6n7AToc4zsMQ8kQF0mOaW0PCX9gtnDXXKDTJE56G3gFB
         9d6w==
X-Gm-Message-State: AOAM533rqpJRn8w69G838AIxk106Qei6gdQgbaJmo3bkmFsBx23wtdRZ
	cF+VbsWmBb+GNJTmZnQCMPcIaDOrQVQVXATeFphQj4WcA/NU6tFQA00OVV3+lhNMSYImUDFny0b
	qbK+4nQOLVmpoXvqJQArDNqNPJcDyJu90Cw==
X-Received: by 2002:a17:906:cd11:: with SMTP id oz17mr18654861ejb.67.1633861100766;
        Sun, 10 Oct 2021 03:18:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiGOHnMpPm92kkQDSwc0F1Q6q6DLTR9dz1U6TGneNCQ9VHXfchnC8F5HoUPJ+33IfCrRIZZQ==
X-Received: by 2002:a17:906:cd11:: with SMTP id oz17mr18654826ejb.67.1633861100365;
        Sun, 10 Oct 2021 03:18:20 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bx11sm1930016ejb.107.2021.10.10.03.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 03:18:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 10 Oct 2021 12:18:15 +0200
Message-Id: <20211010101815.17964-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: USMZDQSZLP6GFPTHTJQIOQG63QQ47HPD
X-Message-ID-Hash: USMZDQSZLP6GFPTHTJQIOQG63QQ47HPD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH] adapter: use sockaddr_storage to solve uninitialized sa_data access
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/USMZDQSZLP6GFPTHTJQIOQG63QQ47HPD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On x86_64 valgrind complains when reading a tag:

    neard[15754]: src/tag.c:tag_initialize()
    neard[15754]: src/tag.c:set_tag_type() protocol 0x8 sens_res 0x0 sel_res 0x0
    neard[15754]: src/tag.c:set_tag_type() tag type 0x3
    neard[15754]: src/tag.c:__near_tag_add() connection 0x513aeb0
    neard[15754]: src/adapter.c:near_adapter_connect() idx 0
    ==15754== Syscall param socketcall.connect(serv_addr.sa_data) points to uninitialised byte(s)
    ==15754==    at 0x4B45057: connect (connect.c:26)
    ==15754==    by 0x1306D8: near_adapter_connect (adapter.c:1068)
    ==15754==    by 0x130BB3: adapter_add_tag (adapter.c:754)
    ==15754==    by 0x130BB3: __near_adapter_add_target (adapter.c:841)
    ==15754==    by 0x13462D: get_targets_handler (netlink.c:574)
    ==15754==    by 0x4A11DF0: nl_recvmsgs_report (in /usr/lib/x86_64-linux-gnu/libnl-3.so.200.26.0)
    ==15754==    by 0x4A122CC: nl_recvmsgs (in /usr/lib/x86_64-linux-gnu/libnl-3.so.200.26.0)
    ==15754==    by 0x134262: __nl_send_msg (netlink.c:151)
    ==15754==    by 0x13494E: nfc_netlink_event_targets_found.isra.0 (netlink.c:627)
    ==15754==    by 0x134DB4: nfc_netlink_event (netlink.c:780)
    ==15754==    by 0x4A11DF0: nl_recvmsgs_report (in /usr/lib/x86_64-linux-gnu/libnl-3.so.200.26.0)
    ==15754==    by 0x4A122CC: nl_recvmsgs (in /usr/lib/x86_64-linux-gnu/libnl-3.so.200.26.0)
    ==15754==    by 0x13483B: __nfc_netlink_event (netlink.c:837)
    ==15754==    by 0x13483B: __nfc_netlink_event (netlink.c:821)
    ==15754==  Address 0x1ffefffa82 is on thread 1's stack
    ==15754==  in frame #1, created by near_adapter_connect (adapter.c:1038)
    ==15754==
    neard[15754]: src/tag.c:__near_tag_read() type 0x3
    neard[15754]: src/adapter.c:__near_adapter_stop_check_presence()
    neard[15754]: src/tag.c:__near_tag_read() driver type 0x1
    neard[15754]: src/tag.c:__near_tag_read() driver type 0x2
    neard[15754]: src/tag.c:__near_tag_read() driver type 0x3

Due to alignment the actual sizeof(sockaddr_nfc) is 16 bytes, but only
first 14 bytes are initialized.  Valgrind complains about remaining two
bytes.  Solve it by using more generic storage - sockaddr_storage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/adapter.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index e0ab8c5d6055..a0042b9dce87 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -1036,9 +1036,10 @@ static gboolean adapter_recv_event(GIOChannel *channel, GIOCondition condition,
 
 int near_adapter_connect(uint32_t idx, uint32_t target_idx, uint8_t protocol)
 {
+	struct sockaddr_storage addr_storage = {};
 	struct near_adapter *adapter;
+	struct sockaddr_nfc *addr;
 	struct near_tag *tag;
-	struct sockaddr_nfc addr;
 	int err, sock;
 
 	DBG("idx %u", idx);
@@ -1059,12 +1060,13 @@ int near_adapter_connect(uint32_t idx, uint32_t target_idx, uint8_t protocol)
 	if (sock == -1)
 		return -errno;
 
-	addr.sa_family = AF_NFC;
-	addr.dev_idx = idx;
-	addr.target_idx = target_idx;
-	addr.nfc_protocol = protocol;
+	addr = (struct sockaddr_nfc *)&addr_storage;
+	addr->sa_family = AF_NFC;
+	addr->dev_idx = idx;
+	addr->target_idx = target_idx;
+	addr->nfc_protocol = protocol;
 
-	err = connect(sock, (struct sockaddr *) &addr, sizeof(addr));
+	err = connect(sock, (struct sockaddr *) addr, sizeof(*addr));
 	if (err) {
 		close(sock);
 		return -errno;
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
