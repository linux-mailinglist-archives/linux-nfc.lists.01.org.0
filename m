Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB0464A68
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Dec 2021 10:14:05 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9BC07100F4841;
	Wed,  1 Dec 2021 01:14:01 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5EE54100F2276
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 01:13:59 -0800 (PST)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E063A3F175
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1638350037;
	bh=qo+4gywoC9EodKPNQtN3jVRiH5Gq/8xnTWvHd0XoISw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=nRsgtVftQFmKz/HEuAtGb2m9pLgTDm6YQSNPEmDRtzV60zJt4FBo9tUUYbKc843yd
	 WKIq9L40NGyXBc+myN8VafJxQTYm+ZHBKHie2I8SXMrKRZ5g1lCyW7SaR+GE7HJdRi
	 OLFkrED7nmidatGTcdcbhd9Wbz45lVVjBL8ORipxLHDFg0/NgzkjY+lf0RZL5IbgRw
	 4sxUtXLEI4fJQXH0pFSjeJDbVWnHYq9iIMdyVn7hpK6I0ks7TIjoFDBfsia9OsnG7E
	 7NhsWdch63OZm189RNBFDulJVf5hAFRMlJIIYTC+fHQgoNzYDgv5PHRXpBl6hEG3PO
	 mOu21Rfb++8SQ==
Received: by mail-lj1-f198.google.com with SMTP id b14-20020a05651c0b0e00b0021a1a39c481so8493257ljr.3
        for <linux-nfc@lists.01.org>; Wed, 01 Dec 2021 01:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qo+4gywoC9EodKPNQtN3jVRiH5Gq/8xnTWvHd0XoISw=;
        b=svT0dh8BYuAg+b91NmZOFb/8jNEyJ+/ONOWIMo9kniBI1ol0+0Woy3Knu3c0wX0MyW
         pol9bBlBaIPQ0p1eyjOQgeLkFarVqcP9FkF0Nyo4TPOxKzV9+ovAQ9bgtoOUm3n28ZqM
         duYZVClVu19EB0Kjo1Fqv6I108DUkZ0nj49ceXbaWVlOAdL3bpdLl5BADCf4CoOhR50e
         HImAcrAyFMkroiOSipCj9zrOEHM7fweiy1Cytit0f/2R5o6w23CZY7sVvU2hWmbTioqa
         Cuhj5EIzpaaRV9tVhzidLMec5uXS6X0r/l2V/JGFnBQ6xDOi1jTr3R2ObAKTBjdRvIC2
         m/Mw==
X-Gm-Message-State: AOAM530gqGLF+n7dtfrj/UWyo31XHwElAKbloRMhQ042ntQsh1WsGtw2
	L53hIMN3tpi8GfDn4N4sbg6nEmpxYcb9AuJfAyZ8drSAVQ7NjBqZiPGsdqwR155BZmBladHZhIl
	lxyfV8u/WM5LJRqzYD48QmH6iazvr5J6igA==
X-Received: by 2002:a2e:740b:: with SMTP id p11mr4425555ljc.215.1638350037041;
        Wed, 01 Dec 2021 01:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuIBqvJJ+vZbfMDITJWjrx9eO/75cpvMeyVGf4/FErP/7ktwEsfw+mnmihaleZkJH0+owi1A==
X-Received: by 2002:a2e:740b:: with SMTP id p11mr4425533ljc.215.1638350036839;
        Wed, 01 Dec 2021 01:13:56 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m10sm1858047lji.11.2021.12.01.01.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 01:13:56 -0800 (PST)
Message-ID: <5664bce3-2c4e-3cc9-0f9c-40f80f207b8f@canonical.com>
Date: Wed, 1 Dec 2021 10:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>, linux-nfc@lists.01.org
References: <20211129050606.873494-1-mgreer@animalcreek.com>
 <20211129050606.873494-4-mgreer@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211129050606.873494-4-mgreer@animalcreek.com>
Message-ID-Hash: UBRO7BMBWBIDL7HO6N727PCHGQKRLTWH
X-Message-ID-Hash: UBRO7BMBWBIDL7HO6N727PCHGQKRLTWH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 3/6] test: Reformat Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UBRO7BMBWBIDL7HO6N727PCHGQKRLTWH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/11/2021 06:06, Mark Greer wrote:
> Reformat the Python-based test scripts using the "Prettier"
> beautifiers (default options). This brings the code closer to
> conformance with the PEP 8 style guide.
> 
> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  test/bt-handover         | 249 ++++++++++++++++++--------------
>  test/handover-agent      | 284 +++++++++++++++++++++---------------
>  test/monitor-near        |  76 +++++-----
>  test/ndef-agent          | 112 +++++++--------
>  test/neard-ui.py         | 304 +++++++++++++++++++++------------------
>  test/neardutils.py       | 138 ++++++++++--------
>  test/phdc-simple-manager | 228 +++++++++++++++--------------
>  test/test-adapter        | 156 ++++++++++----------
>  test/test-device         | 218 ++++++++++++++++------------
>  test/test-tag            | 204 +++++++++++++-------------
>  10 files changed, 1076 insertions(+), 893 deletions(-)
> 
> diff --git a/test/bt-handover b/test/bt-handover
> index eebae9338e00..468e58cb18a8 100755
> --- a/test/bt-handover
> +++ b/test/bt-handover
> @@ -13,119 +13,152 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_RESULT_NOT_YET_HANDLED
>  
>  mainloop = gobject.MainLoop()
>  
> -def device_added(path, interfaces):
> -        for iface, props in interfaces.items():
> -                if "org.neard.Device" in interfaces:
> -                        print("Pairing with %s" % (path))
> -                        device = dbus.Interface(bus.get_object("org.neard", path),
> -                                                        "org.neard.Device")
> -                        device.Push(({ "Type" : "Handover", "Carrier" : "bluetooth"}))
> -                        break
> -
> -def device_removed(path, interfaces):
> -        for iface in interfaces:
> -                if "org.neard.Device" in interfaces:
> -                        print("Lost device %s" % (path))
> -                        mainloop.quit()
> -                        break
> -
> -def remove_paired_devices(bt_adapter):
> -        manager = dbus.Interface(bus.get_object("org.bluez", "/"),
> -                                        "org.freedesktop.DBus.ObjectManager")
> -        objects = manager.GetManagedObjects()
>  
> -        all_adapters = (path for path, interfaces in objects.items() if
> -                                "org.bluez.Adapter1" in interfaces.keys()
> -                                and path.endswith(bt_adapter))
> -
> -        bluez_adapter = None
> -        for adapter in sorted(all_adapters):
> -                bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
> -                                                        adapter),
> -                                                        "org.bluez.Adapter1")
> -                break
> -

Which tool did you use? The autopep8 produces different results, which
look more readable in argument alignment:

--- a/test/bt-handover

+++ b/test/bt-handover

@@ -18,9 +18,8 @@ def device_added(path, interfaces):

     for iface, props in interfaces.items():

         if "org.neard.Device" in interfaces:

             print("Pairing with %s" % (path))

-            device = dbus.Interface(

-                bus.get_object("org.neard", path), "org.neard.Device"

-            )

+            device = dbus.Interface(bus.get_object("org.neard", path),

+                                    "org.neard.Device")

             device.Push(({"Type": "Handover", "Carrier": "bluetooth"}))

             break



Or in array elements:

     tag = neardutils.find_tag(sys.argv[2])



     if sys.argv[3] in ["Text"]:

-        tag.Write(

-            (

-                {

-                    "Type": "Text",

+        tag.Write(({"Type": "Text",

                     "Encoding": sys.argv[4],

                     "Language": sys.argv[5],

-                    "Representation": sys.argv[6],

-                }

-            )

-        )

+                    "Representation": sys.argv[6]}))



     elif sys.argv[3] == "URI":

         write_uri(sys.argv[4:])



The only trouble with autopep8 is that it puts every, even simple, if
with parentheses:

-if sys.argv[1] == "write":

-    if len(sys.argv) < 5:

+if (sys.argv[1] == "write"):

+    if (len(sys.argv) < 5):

         usage()


However existing code already had such syntax in few places.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
