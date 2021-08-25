Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3DC3F773F
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Aug 2021 16:25:48 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BE251100EB845;
	Wed, 25 Aug 2021 07:25:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 21A19100EBBC0
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:43 -0700 (PDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 25B8C3F04D
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629901542;
	bh=dWQld40HyyuNpw/n+LSy4FsBoxLQ4dmEUGnFzO1qgBs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=q2LiEPDCrhumr2PIp5St7d+Xak8KLY0KqjvZYJmlNucM34HFc/aPqByx8eujWHh7y
	 kbf2HTYXH+6gBcHChms3LUz2pT/RHjbA/5G04Xf9UKTdAyfJOHj/qFoVGhXXtTxJJJ
	 mhgxzQfTjtQoteIT2xg3MYiV5GpIwwuLqM2l8kXDGZOp4F1V8birxO88EDIywJi2I7
	 p2kWIYjp3QHawU7xlIDId+seYJD6bGmwME69Al3FsAG02ThTx9uY4hBL0UC3nE9fle
	 VIOqzAzzZzn1+h7zOEsAUJsFTeAD0bnasmesE3K70F2Wraxeudmvv4F6nUzdpNBqLa
	 e6Bwb2qmq7RsQ==
Received: by mail-wr1-f69.google.com with SMTP id a9-20020a0560000509b029015485b95d0cso6721575wrf.5
        for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWQld40HyyuNpw/n+LSy4FsBoxLQ4dmEUGnFzO1qgBs=;
        b=Z6knj1E/3TO9oabSqUtL7MCYgO8jEeLAdy/91LopTxQ8SHGMtcDzUbEoBf5bC9te6E
         E/OW0g1wd4VuR+KmiOZ3fj/8W44kVuxy7L5n62tKYCPbCPNdeYM3Tk7ofnq3s3i57JKi
         9lyXG/A64SKJdkXLPAsJR2lwJ+yo6wPr069RggBt8gbg1X5fsAq6p0i4NLAH0gU5G1Pg
         IQYYB41T2cEaV6q3OGfoJEWv13jHQAe4XlRnSnvfB6vmGDV6eJHJRX/98MTW+re99ToS
         PXCf0uKD/5pJ5GVJmKaZnzEyMjX0pNAoQx9qvw17gx7ch7DTtTlOPb1C4+9U6sZuONEC
         g0oA==
X-Gm-Message-State: AOAM531HfAOWYW9ux1A96aq5QKhrxND32oxT0YxC79zV+cXY5VsXFdAc
	sY5nL23wcfzwOXHFS8cZW0sMINmz1T/Q6ibql9qfysJbLwaNDx4IoQoQ+cMM+/n0rpz8qVyBGTm
	vfR3fOzwKAqpZ3aJHe70pTU8DowZPYAPuSA==
X-Received: by 2002:adf:e702:: with SMTP id c2mr25237465wrm.397.1629901541876;
        Wed, 25 Aug 2021 07:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj7bYleGjuqJyKTtF7fT9/tz8jCKodiT+pN+DKFXdQTP4xquIQjc6L3KH5sb45BRycXVFuEA==
X-Received: by 2002:adf:e702:: with SMTP id c2mr25237449wrm.397.1629901541768;
        Wed, 25 Aug 2021 07:25:41 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id i68sm60375wri.26.2021.08.25.07.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:25:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:24:54 +0200
Message-Id: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: GTKPXEM3MK24FBJ7GW3BOVL3P4LNG7Z4
X-Message-ID-Hash: GTKPXEM3MK24FBJ7GW3BOVL3P4LNG7Z4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 1/6] nfc: microread: remove unused header includes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GTKPXEM3MK24FBJ7GW3BOVL3P4LNG7Z4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/microread/mei.c       | 1 -
 drivers/nfc/microread/microread.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index 8fa7771085eb..8edf761a6b2a 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/nfc.h>
-#include <net/nfc/hci.h>
 #include <net/nfc/llc.h>
 
 #include "../mei_phy.h"
diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
index 9d83ccebd434..bb4d029bb888 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -15,7 +15,6 @@
 #include <linux/nfc.h>
 #include <net/nfc/nfc.h>
 #include <net/nfc/hci.h>
-#include <net/nfc/llc.h>
 
 #include "microread.h"
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
