Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF54460E49
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 06:06:34 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2FB21100F2240;
	Sun, 28 Nov 2021 21:06:33 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ADB18100EB330
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 21:06:31 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id B5B2832009CC;
	Mon, 29 Nov 2021 00:06:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 29 Nov 2021 00:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=UAM4zkNw53BpT/NVlQtI+HKQA3
	Bh4KFQuw3B39gXekI=; b=bWkUgwIQ0ySrPqRuWxnYUOPWPZbMmLOYV/EcR/UaGh
	fCtOEoMTSYYR76NS0JzOaQVwP6qs8lenp8fc0exhgl88jxF+IVEZVOb7VClFAoBk
	O0xYxqsXdYZkq0zK+PNUaCM1VW6HpGgF97pijWy7+QQjbGEWXoG+LUfcLoePSJMe
	rLXvbk9yHi4YsQqEtl8qHXBDLDyTwl4dnDNQcQ2TxJDCBr1OFJox/vcp2wRJLrnJ
	GsjTmyR5XDici+ovNXbqV3WW933mXkIQVKBF/RjXkughiaa7FVFRrdE7ucVlbdXt
	sKnf2FAnEj1Kqkbn+B2h6GInwoYvAzJBPwFMMXx2wSiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UAM4zkNw53BpT/NVl
	QtI+HKQA3Bh4KFQuw3B39gXekI=; b=E/pEUY6PEvDc0gX7mBE3labQPaJVMoO+l
	8VeOtSQ5D7/JSLa0aahC6F1VGZGf/NOQUwqxtM6F4nis8C5ZOEETy3uxOvEHoNkN
	lJXjx+7RyspBfeHdQ0tjh2uDPoOaaGK4HToFLREyFN0T6YZIbvU60F1kAhV0X1TR
	hTm0S//Z9MKReiIz4IVt7Auu8HTv0+KANlRiiV8bzcYqpzs8H1SPPQo7Uvfd0OKe
	SDEjCTXxnBK7D4VToMoBim5Lpj4d2fR6L4X5jW3GIB7ZeFdTo/9yJbQytb9ePWXQ
	hExvhT7WTtcVZOx2gOlghh9063XpfBcm/PpbM1FXlnKHFLfOFjBhA==
X-ME-Sender: <xms:1V-kYZh8WWeOcikXiV4A2nDS8YTzy2HqFmNCgGGxXEnu3KL0FqqHew>
    <xme:1V-kYeC4IFsZbToGhi2bSg6aT0PO7nIlsRE7iD11bLsVvkb76USjjNN0PGNvE-3AH
    od0lEkVYY69Zl-y0w>
X-ME-Received: <xmr:1V-kYZFP6NhthdjptNQoN1mz3MW8PVnTFMYVK2aAS_056ETjAaunD5PGX9-KfvVDTlkez3JKAT8kv2LVs9WOwMcFsBp8qdcnRuFJBzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfirhgv
    vghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtuedvieetheeuudefhfdvvdfggeevfeefgeeivefhudeuheejgfffteegudek
    jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmgh
    hrvggvrhesrghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:1l-kYeSS9W4LtxD8jPEwbO_6UbgiCgsTolrHdDgmLXBLZS0Ext7dKA>
    <xmx:1l-kYWwn_D6ky2V9UdUgXpejp9v8a8cnB0531BRZ1B5Y9oy0aRlueg>
    <xmx:1l-kYU5tPt2igAd04r83tNuk3yJ_4rOYfPqYWv6b4AaMrlFOk1O0Ug>
    <xmx:1l-kYbqWLsa1q5Q0DDEAdWOH-jIAknvK5LOzIc9_rfbc4G_N52xztg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 00:06:29 -0500 (EST)
Received: from blue.animalcreek.com (localhost [127.0.0.1])
	by blue.animalcreek.com (Postfix) with ESMTP id 081A61360499;
	Sun, 28 Nov 2021 22:06:29 -0700 (MST)
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Date: Sun, 28 Nov 2021 22:06:00 -0700
Message-Id: <20211129050606.873494-1-mgreer@animalcreek.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Message-ID-Hash: KNUF6CKLYK7ONTJNGO3MR6NWMW3VREDN
X-Message-ID-Hash: KNUF6CKLYK7ONTJNGO3MR6NWMW3VREDN
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RFC v2 0/6] Python3 conversion + formatting
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KNUF6CKLYK7ONTJNGO3MR6NWMW3VREDN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Take 2 of porting deprecated Python2 code to Python3 plus some
reformatting to better conform with the PEP 8 style guide.  There
are still issue with any python scripts using gobject but this
should move things a small step forward.

Changes v1->v2:
 - replaced tabs with spaces as per PEP 8 style guide
 - removed extra parens in print calls
 - reformatted using "Prettier" (4 space indent as per
   PEP 8 style guide

Mark Greer (6):
  test: Use spaces for Python test scripts
  test: Convert test script from Python2 to Python3
  test: Reformat Python test scripts
  se: Use spaces only for SE Python test scripts
  se: Convert SE test script from Python2 to Python3
  se: Reformat SE Python test scripts

 se/test/test-channel     | 100 ++++++-----
 se/test/test-seel        | 215 ++++++++++++-----------
 test/bt-handover         | 251 +++++++++++++++------------
 test/handover-agent      | 286 +++++++++++++++++-------------
 test/monitor-near        |  80 +++++----
 test/ndef-agent          | 114 ++++++------
 test/neard-ui.py         | 364 +++++++++++++++++++++------------------
 test/neardutils.py       | 141 ++++++++-------
 test/phdc-simple-manager | 252 ++++++++++++++-------------
 test/test-adapter        | 194 +++++++++++----------
 test/test-device         | 240 ++++++++++++++------------
 test/test-tag            | 244 +++++++++++++-------------
 12 files changed, 1337 insertions(+), 1144 deletions(-)

-- 
2.33.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
