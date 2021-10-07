Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 517EC42544A
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:38:27 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 244FF100EA93B;
	Thu,  7 Oct 2021 06:38:25 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A0F8A100EB842
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:38:22 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 53C1F3FFF7
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633613901;
	bh=P9fpmr5HVieD46S8E5o8kyy5EhCx6ykcZHTMM5JxYIs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=uFu9fqReyrlvhYZ45IDxmqQj99Kj9vm6d9iEe1oiRk9TPzBlYgzfC2iySG9yR21hg
	 g9RqctzYUH82dBLyqa+9JyJ33jBR5DkT1SYth+gQiqaHW7VbvsDEmcieg1vR5pFMAb
	 4ZGzDwvU5NfH19gC34AH5uJUUuO69grfZKPdI+XCEkJIQasPxUnQhIdPZIXyYKkOy4
	 bHa5XuZx6GbjuoneoWrV0IHNP8z0hGB/DtjCss8PWSrO8F512kNN9w7zLwTWxKQ+LM
	 GxEkVtFof8u0zd+lLU1wouWJgm8amA7ULwF6rVips/cwdDpg0BzhJe8uKf/Yu3uXPK
	 iNDeC/WLLkogQ==
Received: by mail-ed1-f70.google.com with SMTP id x5-20020a50f185000000b003db0f796903so5887022edl.18
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P9fpmr5HVieD46S8E5o8kyy5EhCx6ykcZHTMM5JxYIs=;
        b=594LJ86jFvWFVpdBwnVPqokPLhI6ST9AnPM/dcDpIjlNssM4NKhvW+01Z3nPxI/mXD
         js1Md8tMvy3vQvUktV6ehH2LNj6At8sR9YjgNzEes9cQWTD6qXcFMpfj3BewBIZB8QQU
         37u6A0CXvVwRvyRUuEwHKEHpe1G5jMMvxMjUjeBUlLYsPKprin7c2jXWSU+Zv4pilwz8
         cxVpfbnSO4sbFyBzypbqSJBPG/G7vhmKOBlITBqT5v5q0Bboo6zk+xPtlUQ12xOU0HUb
         zvqPtkyEnpb011Zm/cIEpxAQOCqO7UkW/2h7t0pKsmN0y/eAZUUqdfo0AxMTbJyP1SLl
         s5Qw==
X-Gm-Message-State: AOAM532ucYROTSRZfmghU9Kn+Jxm4D+wk4qAx3uK0NnpZad0akSnjdSu
	+BE8WNOrK8rEkxnZVJ/SnH4EzBtuQZhmB4JiFNTedSc9SWZzWPgnn9U4eCyxDzjdNlEie9hbk+d
	vzgEF1hmd1YI2l4udYUtTdJOF28nC+Q9FRQ==
X-Received: by 2002:a17:906:d92e:: with SMTP id rn14mr5665111ejb.526.1633613900987;
        Thu, 07 Oct 2021 06:38:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrLgayaQycMXHVAE11eReupmBB4F2YlHzdIYfeZ/DMNQZjj8xXof0XbzXsnm7VmJ48E1Zapw==
X-Received: by 2002:a17:906:d92e:: with SMTP id rn14mr5665084ejb.526.1633613900782;
        Thu, 07 Oct 2021 06:38:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id ay19sm8585613edb.20.2021.10.07.06.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:38:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Mark Greer <mgreer@animalcreek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Thu,  7 Oct 2021 15:30:16 +0200
Message-Id: <20211007133021.32704-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 77DLN42VRAG35EFM5A623KXNJDGLNUC5
X-Message-ID-Hash: 77DLN42VRAG35EFM5A623KXNJDGLNUC5
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 2/7] nfc: nci: replace GPLv2 boilerplate with SPDX
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/77DLN42VRAG35EFM5A623KXNJDGLNUC5/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace standard GPLv2 only license text with SPDX tag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/nci/uart.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index 9bdd9a7d187e..9f7bae51404e 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2015, Marvell International Ltd.
  *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June 1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
- */
-
-/* Inspired (hugely) by HCI LDISC implementation in Bluetooth.
+ * Inspired (hugely) by HCI LDISC implementation in Bluetooth.
  *
  *  Copyright (C) 2000-2001  Qualcomm Incorporated
  *  Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
