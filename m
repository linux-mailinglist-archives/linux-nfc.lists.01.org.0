Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3F2C37BB
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Nov 2020 05:01:08 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 346C2100EF24C;
	Tue, 24 Nov 2020 20:01:07 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E83A5100EF24B
	for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 20:01:04 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id j205so1183090lfj.6
        for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 20:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=d3sDFGVk0SqwFhBEaUj4npS/6CvmGDBt2IRKkek14HQ=;
        b=UJk6LZdaErwdVpQF721a2+ZWHGgUXwPf6rS/hoboYQRsEFWClgyN9SafurayeRlLVC
         xIlIVUSyql2O1tIxPCrOsU9oPDPkBDRpupq0rLJDffEUnPYuKMZbR7d4wg+HZJ2GCj+1
         HgCLEfzXKjAwqyarmh63zpBKC4yBwEh3yC+f5TjiD3ppHYJMKRy9zPnn+plRaK/1tMaJ
         anQ2PGlJOyMFuz/mgfc7tgvWJ8jFGnLxz5oGHFoiFmfBLhfJs5E6VOgZUHSj8XxTumoQ
         6FvOJ2ExOjs2v40+JufgeN6gFYUlVwkDsdz7pa8v6lgUQpOzrxONSqqaEqsCXSMoTinQ
         crwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=d3sDFGVk0SqwFhBEaUj4npS/6CvmGDBt2IRKkek14HQ=;
        b=H6cDkzqPeey+BZC+pUagFgqF9Z8pQMivWCodOmtEaBqLFiNG8azsusWO//ELpDQYkz
         DTxfHdaDEpCK9yraHm8BcPSL1ipoKkC/O1HYaRLYeVf0RCVQg+6aQF3PeHAhM5AtJn18
         pfvLDw3QhY0iWoILyMQs+64L2Ve4LFeJ1lWzhJ3kKtOmFsxLC5KHpBBEUxEbZM2Pn0+G
         By24NdOrs5FhvwYgunr3XW3vLuvdJNscgtxn7wdpaXwMPUuwxLAxQnfSv5kHTFX/D6b8
         I981zVbn6FsO2y11gPui3zrWw9LQ0RzjocGTW/bCJXTM6JmIAhs0qI2wEs0qqc/4zqas
         BEBg==
X-Gm-Message-State: AOAM532TB+chzucZa5ysvwk1yVt21EZb4XzkDvPIyyEYWW7k0sapkMCU
	tzP9yryHEvNwDDjowfR+nzoF99cgsjRnEekZnMc=
X-Google-Smtp-Source: ABdhPJzocaWFFHSlgxizbDLyGWgo+jzVOEfkBDkmPEBgJKG12nx78TyiXPEa646/24LGPjMfKnCz4ZFzloAISgGLKHo=
X-Received: by 2002:a19:ca05:: with SMTP id a5mr547499lfg.571.1606276862567;
 Tue, 24 Nov 2020 20:01:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9a:999:0:b029:97:eac4:b89e with HTTP; Tue, 24 Nov 2020
 20:01:01 -0800 (PST)
In-Reply-To: <20201124141547.GA3316@kozik-lap>
References: <CGME20201123075658epcms2p5a6237314f7a72a2556545d3f96261c93@epcms2p5>
 <20201123075658epcms2p5a6237314f7a72a2556545d3f96261c93@epcms2p5>
 <20201123081940.GA9323@kozik-lap> <CACwDmQDOm6PAyphMiUFizueENMdW3Bo5PvdP_VC_sfBEHc9pMQ@mail.gmail.com>
 <20201124141547.GA3316@kozik-lap>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Wed, 25 Nov 2020 13:01:01 +0900
Message-ID: <CACwDmQC_ptQ+R1xLXRzZq=ewDsp2nA5v-Wb44yudcX92y=HQsA@mail.gmail.com>
To: "krzk@kernel.org" <krzk@kernel.org>
Message-ID-Hash: ZF635IEPIIX74FVOJ6QNCECHABFWVGXH
X-Message-ID-Hash: ZF635IEPIIX74FVOJ6QNCECHABFWVGXH
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu Jeon <bongsu.jeon@samsung.com>, "kuba@kernel.org" <kuba@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 2/2] net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZF635IEPIIX74FVOJ6QNCECHABFWVGXH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/24/20, krzk@kernel.org <krzk@kernel.org> wrote:
> On Tue, Nov 24, 2020 at 09:05:52PM +0900, Bongsu Jeon wrote:
>> On Mon, Nov 23, 2020 at 5:55 PM krzk@kernel.org <krzk@kernel.org> wrote:
>> > > +static enum s3fwrn5_mode s3fwrn82_uart_get_mode(void *phy_id)
>> > > +{
>> > > +     struct s3fwrn82_uart_phy *phy = phy_id;
>> > > +     enum s3fwrn5_mode mode;
>> > > +
>> > > +     mutex_lock(&phy->mutex);
>> > > +     mode = phy->mode;
>> > > +     mutex_unlock(&phy->mutex);
>> > > +     return mode;
>> > > +}
>> >
>> > All this duplicates I2C version. You need to start either reusing
>> > common
>> > blocks.
>> >
>>
>> Okay. I will do refactoring on i2c.c and uart.c to make common blocks.
>>  is it okay to separate a patch for it?
>
> Yes, that would be the best - refactor the driver to split some common
> methods and then in next patch add new s3fwrn82 UART driver.
>
>> > > +
>> > > +static int s3fwrn82_uart_write(void *phy_id, struct sk_buff *out)
>> > > +{
>> > > +     struct s3fwrn82_uart_phy *phy = phy_id;
>> > > +     int err;
>> > > +
>> > > +     err = serdev_device_write(phy->ser_dev,
>> > > +                               out->data, out->len,
>> > > +                               MAX_SCHEDULE_TIMEOUT);
>> > > +     if (err < 0)
>> > > +             return err;
>> > > +
>> > > +     return 0;
>> > > +}
>> > > +
>> > > +static const struct s3fwrn5_phy_ops uart_phy_ops = {
>> > > +     .set_wake = s3fwrn82_uart_set_wake,
>> > > +     .set_mode = s3fwrn82_uart_set_mode,
>> > > +     .get_mode = s3fwrn82_uart_get_mode,
>> > > +     .write = s3fwrn82_uart_write,
>> > > +};
>> > > +
>> > > +static int s3fwrn82_uart_read(struct serdev_device *serdev,
>> > > +                           const unsigned char *data,
>> > > +                           size_t count)
>> > > +{
>> > > +     struct s3fwrn82_uart_phy *phy =
>> > > serdev_device_get_drvdata(serdev);
>> > > +     size_t i;
>> > > +
>> > > +     for (i = 0; i < count; i++) {
>> > > +             skb_put_u8(phy->recv_skb, *data++);
>> > > +
>> > > +             if (phy->recv_skb->len < S3FWRN82_NCI_HEADER)
>> > > +                     continue;
>> > > +
>> > > +             if ((phy->recv_skb->len - S3FWRN82_NCI_HEADER)
>> > > +                             <
>> > > phy->recv_skb->data[S3FWRN82_NCI_IDX])
>> > > +                     continue;
>> > > +
>> > > +             s3fwrn5_recv_frame(phy->ndev, phy->recv_skb,
>> > > phy->mode);
>> > > +             phy->recv_skb = alloc_skb(NCI_SKB_BUFF_LEN,
>> > > GFP_KERNEL);
>> > > +             if (!phy->recv_skb)
>> > > +                     return 0;
>> > > +     }
>> > > +
>> > > +     return i;
>> > > +}
>> > > +
>> > > +static struct serdev_device_ops s3fwrn82_serdev_ops = {
>> >
>> > const
>> >
>> > > +     .receive_buf = s3fwrn82_uart_read,
>> > > +     .write_wakeup = serdev_device_write_wakeup,
>> > > +};
>> > > +
>> > > +static const struct of_device_id s3fwrn82_uart_of_match[] = {
>> > > +     { .compatible = "samsung,s3fwrn82-uart", },
>> > > +     {},
>> > > +};
>> > > +MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
>> > > +
>> > > +static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
>> > > +{
>> > > +     struct s3fwrn82_uart_phy *phy =
>> > > serdev_device_get_drvdata(serdev);
>> > > +     struct device_node *np = serdev->dev.of_node;
>> > > +
>> > > +     if (!np)
>> > > +             return -ENODEV;
>> > > +
>> > > +     phy->gpio_en = of_get_named_gpio(np, "en-gpios", 0);
>> > > +     if (!gpio_is_valid(phy->gpio_en))
>> > > +             return -ENODEV;
>> > > +
>> > > +     phy->gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
>> >
>> > You should not cast it it unsigned int. I'll fix the s3fwrn5 from which
>> > you copied this apparently.
>> >
>>
>> Okay. I will fix it.
>>
>> > > +     if (!gpio_is_valid(phy->gpio_fw_wake))
>> > > +             return -ENODEV;
>> > > +
>> > > +     return 0;
>> > > +}
>> > > +
>> > > +static int s3fwrn82_uart_probe(struct serdev_device *serdev)
>> > > +{
>> > > +     struct s3fwrn82_uart_phy *phy;
>> > > +     int ret = -ENOMEM;
>> > > +
>> > > +     phy = devm_kzalloc(&serdev->dev, sizeof(*phy), GFP_KERNEL);
>> > > +     if (!phy)
>> > > +             goto err_exit;
>> > > +
>> > > +     phy->recv_skb = alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
>> > > +     if (!phy->recv_skb)
>> > > +             goto err_free;
>> > > +
>> > > +     mutex_init(&phy->mutex);
>> > > +     phy->mode = S3FWRN5_MODE_COLD;
>> > > +
>> > > +     phy->ser_dev = serdev;
>> > > +     serdev_device_set_drvdata(serdev, phy);
>> > > +     serdev_device_set_client_ops(serdev, &s3fwrn82_serdev_ops);
>> > > +     ret = serdev_device_open(serdev);
>> > > +     if (ret) {
>> > > +             dev_err(&serdev->dev, "Unable to open device\n");
>> > > +             goto err_skb;
>> > > +     }
>> > > +
>> > > +     ret = serdev_device_set_baudrate(serdev, 115200);
>> >
>> > Why baudrate is fixed?
>> >
>>
>> RN82 NFC chip only supports 115200 baudrate for UART.
>
> OK, I guess it could be extended in the future for other frequencies, if
> needed.
>
>>
>> > > +     if (ret != 115200) {
>> > > +             ret = -EINVAL;
>> > > +             goto err_serdev;
>> > > +     }
>> > > +
>> > > +     serdev_device_set_flow_control(serdev, false);
>> > > +
>> > > +     ret = s3fwrn82_uart_parse_dt(serdev);
>> > > +     if (ret < 0)
>> > > +             goto err_serdev;
>> > > +
>> > > +     ret = devm_gpio_request_one(&phy->ser_dev->dev,
>> > > +                                 phy->gpio_en,
>> > > +                                 GPIOF_OUT_INIT_HIGH,
>> > > +                                 "s3fwrn82_en");
>> >
>> > This is weirdly wrapped.
>> >
>>
>> Did you ask about devem_gpio_request_one function's parenthesis and
>> parameters?
>> If it is right, I changed it after i ran the checkpatch.pl --strict and
>> i saw message like the alignment should match open parenthesis.
>
> Yeah, but it does not mean to wrap after each argument. It should be
> something like:
>
>         ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->gpio_en,
>                                     GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
>
>>
>> > > +     if (ret < 0)
>> > > +             goto err_serdev;
>> > > +
>> > > +     ret = devm_gpio_request_one(&phy->ser_dev->dev,
>> > > +                                 phy->gpio_fw_wake,
>> > > +                                 GPIOF_OUT_INIT_LOW,
>> > > +                                 "s3fwrn82_fw_wake");
>> > > +     if (ret < 0)
>> > > +             goto err_serdev;
>> > > +
>> > > +     ret = s3fwrn5_probe(&phy->ndev, phy, &phy->ser_dev->dev,
>> > > &uart_phy_ops);
>> > > +     if (ret < 0)
>> > > +             goto err_serdev;
>> > > +
>> > > +     return ret;
>> > > +
>> > > +err_serdev:
>> > > +     serdev_device_close(serdev);
>> > > +err_skb:
>> > > +     kfree_skb(phy->recv_skb);
>> > > +err_free:
>> > > +     kfree(phy);
>> >
>> > Eee.... why? Did you test this code?
>> >
>>
>> I didn't test this code. i just added this code as defense code.
>> If the error happens, then allocated memory and device will be free
>> according to the fail case.
>
> Really, this won't work. It's kind of obvious why... You cannot use
> kfree() on memory which is not allocated with kzalloc(). Or IOW, you
> cannot use it if it is being freed by devm.
>
> I doubt that you tested either this or the remove callback because if
> you did test it, you would see easily:
>

Thanks to explain it in detail.

> Please fix the double-free.
>

I understand it and will remove the kfree(phy).
And i did the remove callback test using following echo command's
parameters on raspberry pi.
But i didn't see the error log like yours.

Echo serial0-0 > /sys/bus/serial/devices/serial0/serial0-0/driver/unbind

> Best regards,
> Krzysztof
>
>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
