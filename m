Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158B2CC972
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Dec 2020 23:19:52 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 14FE4100EBB8B;
	Wed,  2 Dec 2020 14:19:51 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 33C91100EBB89
	for <linux-nfc@lists.01.org>; Wed,  2 Dec 2020 14:19:12 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id t6so7126832lfl.13
        for <linux-nfc@lists.01.org>; Wed, 02 Dec 2020 14:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EIruGRd4mugAkAFXMPG5djeoGY4ogM1hgJDgqpib//o=;
        b=svXD3R/pbQ6J9th26y4lpPOmwEM9/0s/xp218p7FiAHnwYWWXxaEqeCEZE3QPcOD/P
         gv3p0+td2N3+kOapYmKu1ryt053ELTkOvg+mlxe5l4k03T5A1pIHhQhnqfgJYzOcnIvm
         mk8eme3KuOw3OSk9yNjihGfjaDahcM2Vnm3jeJqiQlkVdI8NWi7bHr9SXOk/bcqvjw71
         GkC6G9LoTKtAc/MOy0oDEPJOKjGdhwOD2VwxOjIi1U0FjOUFRSPo/YfOpR5ehfG+QVfZ
         V5BWLP+Iof+5B8nxIZvpxOx4C43W8YqY44RIogxIUkWExGKqPwnkilcqOf6Y569+/zRt
         oiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EIruGRd4mugAkAFXMPG5djeoGY4ogM1hgJDgqpib//o=;
        b=agrICJx0Uis7Y1H0nt2GQGEfIxH3qkXTHfiJqM3QNHvzF3K2+8CdKelDgV/2c/+7NV
         k89Zi952SXLDNCfHqed4vgYTlSIrzIP91J+GFGC7YLvxvAAKekpE82Iu4OR3Q4zyEELU
         z7lFH7/NDYyUH7nnb5/dMJq6HZpJUPW3N72i7KDUkDyCI4zXiUXLun5pylStHjt7FbJA
         tviNMnVmdEtYv0dgRQHPrwDvevlPkjFtVIj94v8XAJiC7oCX+tsQ8BlL5v8qv3j/K2a4
         PEsdMaddcL6LQ3HhJ90hHPgSs2iBg+tInnrAObcOs0keS2UXYcxQs1oypS1mESlJ/Zh/
         da0A==
X-Gm-Message-State: AOAM531Y29kp991ROQfFX2UzW0m3kmi8Mr4LHFZ5OhrUcMmmfE1H1zUJ
	e09FXFtPsztRsSN/Q+q+0thV1bF3bbLGi0efGp0=
X-Google-Smtp-Source: ABdhPJwiIZjEuef9Wjfsp+m4vlUrAjDPdAzP3NvFPlL1p9wwwRbQmbUZEUu6Lxa6iSLes34IFLhCOeElmzUI2n2Zg4U=
X-Received: by 2002:ac2:5e91:: with SMTP id b17mr84979lfq.442.1606947541002;
 Wed, 02 Dec 2020 14:19:01 -0800 (PST)
MIME-Version: 1.0
References: <5fc100ec.1c69fb81.58b7b.2dee@mx.google.com> <20201130184845.304f54d3@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201130184845.304f54d3@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Thu, 3 Dec 2020 07:18:49 +0900
Message-ID: <CACwDmQCvB0WSQ86igZXT9FAihqGbM4THXWXj-jRAzr6EhSDf7g@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID-Hash: 47UANMDWK7AAEFS6RHYATRUTLDWK3IWT
X-Message-ID-Hash: 47UANMDWK7AAEFS6RHYATRUTLDWK3IWT
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next v3] net/nfc/nci: Support NCI 2.x initial sequence
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/47UANMDWK7AAEFS6RHYATRUTLDWK3IWT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 1, 2020 at 11:48 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 27 Nov 2020 22:36:31 +0900 bongsu.jeon2@gmail.com wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > implement the NCI 2.x initial sequence to support NCI 2.x NFCC.
> > Since NCI 2.0, CORE_RESET and CORE_INIT sequence have been changed.
> > If NFCEE supports NCI 2.x, then NCI 2.x initial sequence will work.
> >
> > In NCI 1.0, Initial sequence and payloads are as below:
> > (DH)                     (NFCC)
> >  |  -- CORE_RESET_CMD --> |
> >  |  <-- CORE_RESET_RSP -- |
> >  |  -- CORE_INIT_CMD -->  |
> >  |  <-- CORE_INIT_RSP --  |
> >  CORE_RESET_RSP payloads are Status, NCI version, Configuration Status.
> >  CORE_INIT_CMD payloads are empty.
> >  CORE_INIT_RSP payloads are Status, NFCC Features,
> >     Number of Supported RF Interfaces, Supported RF Interface,
> >     Max Logical Connections, Max Routing table Size,
> >     Max Control Packet Payload Size, Max Size for Large Parameters,
> >     Manufacturer ID, Manufacturer Specific Information.
> >
> > In NCI 2.0, Initial Sequence and Parameters are as below:
> > (DH)                     (NFCC)
> >  |  -- CORE_RESET_CMD --> |
> >  |  <-- CORE_RESET_RSP -- |
> >  |  <-- CORE_RESET_NTF -- |
> >  |  -- CORE_INIT_CMD -->  |
> >  |  <-- CORE_INIT_RSP --  |
> >  CORE_RESET_RSP payloads are Status.
> >  CORE_RESET_NTF payloads are Reset Trigger,
> >     Configuration Status, NCI Version, Manufacturer ID,
> >     Manufacturer Specific Information Length,
> >     Manufacturer Specific Information.
> >  CORE_INIT_CMD payloads are Feature1, Feature2.
> >  CORE_INIT_RSP payloads are Status, NFCC Features,
> >     Max Logical Connections, Max Routing Table Size,
> >     Max Control Packet Payload Size,
> >     Max Data Packet Payload Size of the Static HCI Connection,
> >     Number of Credits of the Static HCI Connection,
> >     Max NFC-V RF Frame Size, Number of Supported RF Interfaces,
> >     Supported RF Interfaces.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
>
> >  static void nci_init_req(struct nci_dev *ndev, unsigned long opt)
> >  {
> > -     nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
> > +     struct nci_core_init_v2_cmd *cmd = (struct nci_core_init_v2_cmd *)opt;
> > +
> > +     if (!cmd)
> > +             nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
> > +     else
> > +             /* if nci version is 2.0, then use the feature parameters */
> > +             nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD,
> > +                          sizeof(struct nci_core_init_v2_cmd), cmd);
>
> This would be better written as:
>
>         u8 plen = 0;
>
>         if (opt)
>                 plen = sizeof(struct nci_core_init_v2_cmd);
>
>         nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, plen, (void *)opt);
>
> > +
>
> unnecessary empty line
>
> >  }
> >
> >  static void nci_init_complete_req(struct nci_dev *ndev, unsigned long opt)
> > @@ -497,8 +505,18 @@ static int nci_open_device(struct nci_dev *ndev)
> >       }
> >
> >       if (!rc) {
> > -             rc = __nci_request(ndev, nci_init_req, 0,
> > -                                msecs_to_jiffies(NCI_INIT_TIMEOUT));
> > +             if (!(ndev->nci_ver & NCI_VER_2_MASK)) {
> > +                     rc = __nci_request(ndev, nci_init_req, 0,
> > +                                        msecs_to_jiffies(NCI_INIT_TIMEOUT));
> > +             } else {
> > +                     struct nci_core_init_v2_cmd nci_init_v2_cmd;
> > +
> > +                     nci_init_v2_cmd.feature1 = NCI_FEATURE_DISABLE;
> > +                     nci_init_v2_cmd.feature2 = NCI_FEATURE_DISABLE;
> > +
> > +                     rc = __nci_request(ndev, nci_init_req, (unsigned long)&nci_init_v2_cmd,
> > +                                        msecs_to_jiffies(NCI_INIT_TIMEOUT));
> > +             }
>
> again please try to pull out the common code:
>
>         struct nci_core_init_v2_cmd nci_init_v2_cmd = {
>                 .feature1 = NCI_FEATURE_DISABLE;
>                 .feature2 = NCI_FEATURE_DISABLE;
>         };
>         unsigned long opt = 0;
>
>         if (ndev->nci_ver & NCI_VER_2_MASK)
>                 opt = (unsigned long)&nci_init_v2_cmd;
>
>         rc = __nci_request(ndev, nci_init_req, opt,
>                            msecs_to_jiffies(NCI_INIT_TIMEOUT));
>
>
> >       }
>
> > -static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
> > +static unsigned char nci_core_init_rsp_packet_v1(struct nci_dev *ndev, struct sk_buff *skb)
> >  {
> >       struct nci_core_init_rsp_1 *rsp_1 = (void *) skb->data;
> >       struct nci_core_init_rsp_2 *rsp_2;
> > @@ -48,16 +51,14 @@ static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
> >       pr_debug("status 0x%x\n", rsp_1->status);
> >
> >       if (rsp_1->status != NCI_STATUS_OK)
> > -             goto exit;
> > +             return rsp_1->status;
> >
> >       ndev->nfcc_features = __le32_to_cpu(rsp_1->nfcc_features);
> >       ndev->num_supported_rf_interfaces = rsp_1->num_supported_rf_interfaces;
> >
> > -     if (ndev->num_supported_rf_interfaces >
> > -         NCI_MAX_SUPPORTED_RF_INTERFACES) {
> > -             ndev->num_supported_rf_interfaces =
> > -                     NCI_MAX_SUPPORTED_RF_INTERFACES;
> > -     }
> > +     ndev->num_supported_rf_interfaces =
> > +             min((int)ndev->num_supported_rf_interfaces,
> > +                 NCI_MAX_SUPPORTED_RF_INTERFACES);
> >
> >       memcpy(ndev->supported_rf_interfaces,
> >              rsp_1->supported_rf_interfaces,
> > @@ -77,6 +78,58 @@ static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
> >       ndev->manufact_specific_info =
> >               __le32_to_cpu(rsp_2->manufact_specific_info);
> >
> > +     return NCI_STATUS_OK;
> > +}
> > +
> > +static unsigned char nci_core_init_rsp_packet_v2(struct nci_dev *ndev, struct sk_buff *skb)
> > +{
> > +     struct nci_core_init_rsp_nci_ver2 *rsp = (void *)skb->data;
> > +     unsigned char rf_interface_idx = 0;
>
> Prefer the use of u8 type in the kernel
>
> > +     unsigned char rf_extension_cnt = 0;
> > +     unsigned char *supported_rf_interface = rsp->supported_rf_interfaces;
>
> Please order the variable declarations longest to shortest.
> Don't initialize them inline if that'd cause the order to break.
>
> > +     pr_debug("status %x\n", rsp->status);
> > +
> > +     if (rsp->status != NCI_STATUS_OK)
> > +             return rsp->status;
> > +

Thank you for your advice.
I will send a new version.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
