Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCE425448
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:38:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F1D13100EB842;
	Thu,  7 Oct 2021 06:38:23 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2CDC7100EB842
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:38:20 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B69E540006
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633613899;
	bh=upOlM+YeqtC352ZviJAd3z51Fz6iHXHCRP6fI5EVtCE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=K5uPIBXYNqgj8WIbZHM0hMG99YXTHyO+Zovg4ikX+hRJC2O1bpHSFvA3kuTx9sSnO
	 VzhbizAApl2oBaiTMoD1M8r87qsbRPPHJ8iU6naqHZEbE8t9nZEBOMce5SvlQvtoQw
	 eYM7ZVfys1sbwbZrUKTcI20rb8b7YGUaOayHhX5Fc6bsWRXmiRi8+G9V+1loYzyM6i
	 PbkO9W6CPTxNCO2VkI4gE6RJ1ivFs7Mnrzsn629kzGx94QfPk+fUi3ITaCMOzwXThX
	 rpkg7yyPnSsR7HqMCSM5VrEV7tbLrUFmFvtef/BpjOLvpYeZPiJPPZ4E8s6XQ5UVMv
	 6tp0izuzWVg+g==
Received: by mail-ed1-f69.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so3879319edy.14
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=upOlM+YeqtC352ZviJAd3z51Fz6iHXHCRP6fI5EVtCE=;
        b=jZRGbfY5nPl6UfEGdsst4NzzFnE4hcwbSP/1brSsVuJidQZdarBfQ0+D+/+gMgMHAC
         jXIGWAQZxVLV2Ltz0LopiPBu/KSFwzVGX7D9gUs+Sdxie/BQTxVwQK4okyA8ZANHPGKc
         nLj8ZuJ3IITg12YFPOzlc3g4TkQ40VHtZ+/lJQfAQE4w8CoHLVQD2IYStweeKWInZykj
         6QbjQglu0ZpdLTvJt9ArbstraI8lsI068Z1VYhqNQubzgwnmkAsrgYBoitajyScKYddc
         YiUD0ZEL5D64njlAZAszTHLeJNMOndVW5cD30zbYLDg55YCGFsjPCepMMEhqBDWoPtpN
         Ydrg==
X-Gm-Message-State: AOAM533Iqt/O+l4F0p0YBvC/3UMbqlcVR/RlXEWzrc4wY9wRIzA6WQmN
	P3SnlOa5qcgNgVAD0NFLz+s9mYqOr8QQ/DpezeFI6b3hjcmgt/mYsWQsZ4meHzllS+bTZGOCsaN
	zGXkGM8RZYf9DIdZ5fxoQwTjAOv41+VPIPQ==
X-Received: by 2002:a17:906:2cc9:: with SMTP id r9mr5959284ejr.138.1633613899362;
        Thu, 07 Oct 2021 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysz8D0vmS0o8wE8Hx/CAwpkXQSt/jJcGqT2FQLo0gEaR7VKf/x4sZjGm1ZRgWQW1Xzl63ykg==
X-Received: by 2002:a17:906:2cc9:: with SMTP id r9mr5959208ejr.138.1633613898754;
        Thu, 07 Oct 2021 06:38:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id ay19sm8585613edb.20.2021.10.07.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:38:18 -0700 (PDT)
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
Date: Thu,  7 Oct 2021 15:30:14 +0200
Message-Id: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: ERICJTZFZQ7ZJOJ7GZD7K6SB2XZJXZGU
X-Message-ID-Hash: ERICJTZFZQ7ZJOJ7GZD7K6SB2XZJXZGU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 0/7] nfc: minor printk cleanup
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ERICJTZFZQ7ZJOJ7GZD7K6SB2XZJXZGU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This is a rebase and resend of v2. No other changes.

Changes since v1:
1. Remove unused variable in pn533 (reported by kbuild).

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  nfc: drop unneeded debug prints
  nfc: nci: replace GPLv2 boilerplate with SPDX
  nfc: s3fwrn5: simplify dereferencing pointer to struct device
  nfc: st-nci: drop unneeded debug prints
  nfc: st21nfca: drop unneeded debug prints
  nfc: trf7970a: drop unneeded debug prints
  nfc: microread: drop unneeded debug prints

 drivers/nfc/microread/i2c.c    |  4 ----
 drivers/nfc/microread/mei.c    |  2 --
 drivers/nfc/s3fwrn5/firmware.c | 29 +++++++++++------------------
 drivers/nfc/s3fwrn5/nci.c      | 18 +++++++-----------
 drivers/nfc/st-nci/i2c.c       |  4 ----
 drivers/nfc/st-nci/ndlc.c      |  4 ----
 drivers/nfc/st-nci/se.c        |  6 ------
 drivers/nfc/st-nci/spi.c       |  4 ----
 drivers/nfc/st21nfca/i2c.c     |  4 ----
 drivers/nfc/st21nfca/se.c      |  4 ----
 drivers/nfc/trf7970a.c         |  8 --------
 net/nfc/hci/command.c          | 16 ----------------
 net/nfc/hci/llc_shdlc.c        | 12 ------------
 net/nfc/llcp_commands.c        |  8 --------
 net/nfc/llcp_core.c            |  5 +----
 net/nfc/nci/core.c             |  4 ----
 net/nfc/nci/hci.c              |  4 ----
 net/nfc/nci/ntf.c              |  9 ---------
 net/nfc/nci/uart.c             | 16 ++--------------
 19 files changed, 21 insertions(+), 140 deletions(-)

-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
