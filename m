Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E349D3DCE0D
	for <lists+linux-nfc@lfdr.de>; Mon,  2 Aug 2021 01:11:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 433B7100EBB68;
	Sun,  1 Aug 2021 16:11:47 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 06561100EC1EB
	for <linux-nfc@lists.01.org>; Sun,  1 Aug 2021 16:11:43 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E47A75C009D;
	Sun,  1 Aug 2021 19:11:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 01 Aug 2021 19:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=A9+4SNqHuZnbQjJo883Dzx9rvjS
	+7ibOtfEv1vJ0it4=; b=egGJF6GWmjIGAc9OLHOKveHhahPYaZuywfu8k+builm
	yTMAHm2dEsemUnZ+9SKqluBwflX0jGwIWwbryDS4pp65fevsTrZSiGqWlyNlePO6
	tje6/o4juqwQFlxWIV4sCc9Oi3QjN684vvZFu5iRShzhcZw8bB3N8NROHn8YsJdP
	p/vD2kf/NjC14hRAa4IpPnjrBDOtAP+mam/nrfmiJwnsFJzHdIoip5GSKSlJTqiO
	v28MvvrdPh6+AHweeoTgsiKQUGfPOSMEUAIDbXG4BpNYqRnRGimMSCf2X/WT/xHj
	tRPtdUaSORITx1y08zzwux0pzlaB0BKFDvPHIZd0+XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A9+4SN
	qHuZnbQjJo883Dzx9rvjS+7ibOtfEv1vJ0it4=; b=N1GQPeUEmpDe4JA7rQVARp
	zwyDIYfMGD1qAykVTEPCrMrbSDWf7ppkIXn61IG2yQLECkHSWP5NxuIXOWl4+G1g
	fog51yIfIy6tjFCkDbhRZiz/u5TOFX9RMOQuEcsYAeKDxSh/RfOjTDT1/oDhWFZE
	gQ4RGoAGUF0tpM9AynUz6kVWadkncVxZo3nCpeoJVgKXKsgJhYSUos4BdJ9nQC1V
	aXCLFs4Zytui8/tRxVCzAJkL30VFNVvHZFRm1ycwTNC16SaF6KKXkDLlZoU7Eokc
	MNILrVijm6+o9NVEN08Yl1TTDh1JTdwVJTKJY6lyNnPVfcSO700Hskcq7wmSIRvQ
	==
X-ME-Sender: <xms:LioHYeK2I19SdS_zmtJm0hCMX_0jdX7HSTQ-Vif0wLny1L3VBhVoJw>
    <xme:LioHYWIG0nShLEhRbOOJl8IMEqojaOKCvzEJSPFBASZWq4E92OIQ35Vdp_qh_RkvH
    b4yUwOIhZEB0g4F2A>
X-ME-Received: <xmr:LioHYesb4UT6JgvXappBxtHWWwqwqPy1BHC1gQUiTQkWtLSZ-mIvaLmrwTmL05uykSYb9pw6CXpRSj0NOEb1KKIwwiD88VAZcxMKIVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddriedugddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepudejleegjeelgeelveekkedvveduhfetueeitdelhedtudelledvieff
    hfdvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghr
    vggvkhdrtghomh
X-ME-Proxy: <xmx:LioHYTZxdV6Z1x1p-jlXYrse_rAh32aYVXRD0KnVLXpVO4x5XhzqZw>
    <xmx:LioHYVZ8wyk0cGoHiIAyZT7royisXVheYU2Dx1Tc-oPKJIJXtsZl0w>
    <xmx:LioHYfDQHx5BH4MlhZxQnHHz9FvuLktKI4p5asBTBH5lsd174SwItA>
    <xmx:LioHYUwtmSDTQRiARXkZw6qFAsh1aATP_TvuPsb5noEqCG_WcQ7ENw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Aug 2021 19:11:41 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id CF1BC1360233; Sun,  1 Aug 2021 16:11:40 -0700 (MST)
Date: Sun, 1 Aug 2021 16:11:40 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210801231140.GA397941@animalcreek.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: PFHWONL26A3GCZFJXROKROBBSIYCNK2U
X-Message-ID-Hash: PFHWONL26A3GCZFJXROKROBBSIYCNK2U
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PFHWONL26A3GCZFJXROKROBBSIYCNK2U/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 19, 2021 at 01:07:06PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Mark asked for resending fixes separate from setting up CI under Github
> Actions, so here is a combination of all my previously sent patches
> related only to the actual C code:
> 
> https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozlowski@canonical.com/T/#t
> 
> This includes fixes for GCC/clang warnings, memory leaks, memory
> corruption and few other minor fixes. The UTF-8 and UTF-16 is not
> entirely fixed and I removed the work-in-progress patches.
> 
> Changes since v1 are:
> 1. Group all patches based on prefix (unit file), instead of topic.
> 2. Put the build-related patches at the end.
> 3. Remove all CI-related patches.
> 4. Drop patch: ndef: fix parsing of UTF-16 text payload.
> 5. Fix commit msg in: nfctool: pass the format as string literal
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (73):
>   Drop empty NEWS
>   nfctool: fix adapter_get_devices() cast-function-type
>   nfctool: fix adapter_print_target() cast-function-type
>   nfctool: fix adapter_print_info() cast-function-type
>   nfctool: fix adapter_compare_idx() cast-function-type
>   nfctool: fix nfctool_send_dep_link_up() cast-function-type
>   nfctool: fix nfctool_print_and_remove_snl() cast-function-type
>   nfctool: use proper format for integers (-Wformat)
>   nfctool: pass the format as string literal
>   dbus: fix -Wformat in near_dbus_encode_string()
>   unit: pass real UTF-8 for testing text NDEF
>   ndef: check UTF-16 text payload length
>   ndef: silence clang -Wcast-align warning
>   ndef: use NDEF_TEXT_RECORD_UTF16_STATUS define
>   ndef: use proper format for integers (-Wformat)
>   ndef: make freeing near_ndef_message reusable
>   se: fix multiple apdu definitions
>   se: silence clang -Wcast-align warning
>   se: use proper format for integers (-Wformat)
>   adapter: adjust indentation of continued arguments
>   adapter: use proper format for integers (-Wformat)
>   gdbus: do not shadow global 'pending' variable (-Wshadow)
>   nciattach: fix poll.h include location
>   nciattach: do not shadow other local 'opt' variable (-Wshadow)
>   bluetooth: use proper format for integers (-Wformat)
>   nfctype2: use proper format for integers (-Wformat)
>   nfctype3: use proper format for integers (-Wformat)
>   nfctype5: use proper format for integers (-Wformat)
>   nfctype5: fix returning uninitialized stack value in
>     t5_tag_is_ti_pro()
>   mifare: use proper format for integers (-Wformat)
>   mifare: use unsigned int to suppress compiler -Wstrict-overflow
>   p2p: use proper format for integers (-Wformat)
>   npp: use proper format for integers (-Wformat)
>   device: use proper format for integers (-Wformat)
>   manager: use proper format for integers (-Wformat)
>   netlink: use proper format for integers (-Wformat)
>   gdbus: annotate printf-like functions as accepting format
>   snep-send: fix near_ndef_message memory leak
>   tag: use proper format for integers (-Wformat)
>   tag: do not open-code freeing ndef message
>   snep: do not open-code freeing ndef message
>   snep: remove useless NULL-ify of local pointer variable
>   snep: fix double free of GSList
>   snep: fix fragmented response memory leaks
>   unit: use g_assert_cmpstr()
>   unit: use g_assert_cmpint() and g_assert_cmpuint()
>   unit: fix recv() and send() return types
>   unit: use g_assert_null()
>   unit: use g_assert_cmpmem()
>   unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
>   unit: do not shadow global 'text' variable (-Wshadow)
>   unit: do not shadow global 'uri' variable (-Wshadow)
>   unit: use proper format for integers (-Wformat)
>   unit: fix memory leaks in test-ndef-parse
>   unit: do not open-code freeing ndef message
>   unit: fix memory leaks in test-ndef-build
>   unit: fix memory leaks in test-snep-read error paths
>   unit: fix record memory leak in test-snep-read
>   unit: fix records GList memory leak in test-snep-read
>   unit: do not pass NULL to memcpy()
>   unit: do not search for headers locally where they do not exist
>   unit: remove duplicated invalid definitions in test-snep-read
>   unit: remove duplicated definitions in test-ndef-parse
>   unit: add few asserts in test-snep-read
>   HACKING: refine required packages
>   build: fix setting CFLAGS on dash shell (Alpine Linux)
>   build: add more compiler warnings
>   build: enable -Wshadow and -Wformat-signedness compiler warnings
>   build: enable -Wformat=2 warnings
>   build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=2
>     warnings
>   build: fix missing usage of PIE check result
>   build: add support for GCC sanitizers (asan, lsan and ubsan)
>   AUTHORS: Mention Krzysztof Kozlowski's contributions

Applied.

Thanks Krzysztof.

FYI, I built neard natively with these patches applied on an amd64
(ubuntu 20.04) and an ARM Cortext A8 (debian 10).  Both build cleanly
and I could read & write tags.

My plans include:
- python3-ize the python test scripts
- debug an issue I think I saw
- look for races that I recall running into in the past
- recruit another arm SoC for testing
- get my trf7970 working again

When things settle down and we're happy with what we have, we should
cut a new version (0.17 or 1.0 even).


Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
