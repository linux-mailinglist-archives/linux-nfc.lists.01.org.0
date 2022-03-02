Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38A4CAE9B
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Mar 2022 20:25:33 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 242FA100EB339;
	Wed,  2 Mar 2022 11:25:32 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A07B1100EB847
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 11:25:29 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 54B963F5F4
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646249127;
	bh=yRTE0dXDieeLqipRcJqUM5emUc5L/qHhnbBmseJ0BJU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Jv2RtizdGwinP2qfowNk4Ywy1N3i4Q4KpqSWNcUHHCciU02rQOh9NRJcy8qabHJbu
	 qxG2x5iyQ3gMWu/hbhRHljUJihGRtXzGqU5ZAunqmi712EbU+QrAkVL0Oh2PhVwtcK
	 nlEbUkjk1aHXjgzU7rLDsNAVATum8MPAX6jJnfDl410OrIJ0tECM1CF2OvtvA8GGi4
	 2cgL/nNnH814updnzNUpNqf/bFFMvcoj7gx0ngvb0CbXcY+hVXfwHC8TUtVzFRuSIo
	 uS08M5U2JeamZcKlj7zOtu79Hn+Bbo8fd5KipX7N1g5I3Wn82EViIZMLYFNBeWlrrn
	 PZPsvqiaNOqaQ==
Received: by mail-ed1-f70.google.com with SMTP id d11-20020a50c88b000000b00410ba7a14acso1553772edh.6
        for <linux-nfc@lists.01.org>; Wed, 02 Mar 2022 11:25:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRTE0dXDieeLqipRcJqUM5emUc5L/qHhnbBmseJ0BJU=;
        b=7utsH+lpUfk8xxhjd2VxDcTPtlSZlVoTojfIF8I0G0s3a1Liu0qiR8Q2Qm3IhmZGm2
         6Du2QHKX4b7SHcYvXXPilRj0XD+OZwokSgMgvwZDtfLRUXRu+mLzk7Ylz/SCuHiOa/6D
         5uT53r656gtM7zggDiCt1P4IjmlI5Sn/39XPfBCdn28FUN+mRM0U5QFUGe4QF7gQVO1L
         HOgEgosj75Z/Fp9ksMUzbd6vRe8KdRGfFjpWEDXunXQdPtkdQJySewRrydHksD/YfXM8
         eAIeDLJ9Qjoxeng5SyrjNo/cLRaiVc7TznPqzCwpQDelU7RgdIFgRjAGRNl7qEfcYGo1
         j52w==
X-Gm-Message-State: AOAM533ZS6BH2M3xRlIltIhafl8wKD2QOpuGIhEdoJpCpsm33yJGoeJl
	cLuoqhVDOvRgVAetGSJIfckqlamG9zwnlw2bLkQkaE1k9mgr1z+Lcfgi1OpdicN9tw1UeZza63r
	nRvOtQb8+JmBj0dsBz/SbpFW0o7DS/jq2gQ==
X-Received: by 2002:a17:906:d964:b0:6ca:4019:3928 with SMTP id rp4-20020a170906d96400b006ca40193928mr24495910ejb.762.1646249127023;
        Wed, 02 Mar 2022 11:25:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymNIa6tXZ6VSjhto2ZRHEvmJFRAiiKkV9BB4bSPd2kVGliWkPAB8/SjWMA+lWclcfMKx3gNA==
X-Received: by 2002:a17:906:d964:b0:6ca:4019:3928 with SMTP id rp4-20020a170906d96400b006ca40193928mr24495893ejb.762.1646249126792;
        Wed, 02 Mar 2022 11:25:26 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b00415b0730921sm1482765edk.42.2022.03.02.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:25:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Mar 2022 20:25:17 +0100
Message-Id: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: B7CZGUSMOYBZWLWUPD3CM4ZT4HAHZCBN
X-Message-ID-Hash: B7CZGUSMOYBZWLWUPD3CM4ZT4HAHZCBN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 0/6] nfc: llcp: few cleanups/improvements
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/B7CZGUSMOYBZWLWUPD3CM4ZT4HAHZCBN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

These are improvements, not fixing any experienced issue, just looking correct
to me from the code point of view.

Changes since v1
================
1. Split from the fix.

Testing
=======
Under QEMU only. The NFC/LLCP code was not really tested on a device.

Best regards,
Krzysztof

Krzysztof Kozlowski (6):
  nfc: llcp: nullify llcp_sock->dev on connect() error paths
  nfc: llcp: simplify llcp_sock_connect() error paths
  nfc: llcp: use centralized exiting of bind on errors
  nfc: llcp: use test_bit()
  nfc: llcp: protect nfc_llcp_sock_unlink() calls
  nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is
    actually sent"

 net/nfc/llcp.h      |  1 -
 net/nfc/llcp_core.c |  9 +--------
 net/nfc/llcp_sock.c | 49 ++++++++++++++++++++++-----------------------
 3 files changed, 25 insertions(+), 34 deletions(-)

-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
