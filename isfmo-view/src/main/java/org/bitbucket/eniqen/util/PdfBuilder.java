package org.bitbucket.eniqen.util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import org.apache.commons.compress.utils.IOUtils;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;
import org.bitbucket.eniqen.model.PhoneNumber;
import org.bitbucket.eniqen.model.Tariff;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * Created by Mikhail on 31.01.2016.
 */
public class PdfBuilder extends AbstractPdfView {

    public static final String CONTRACT_WITH_NUMBER = "Договор об оказании услуг связи \"T-Mobile\"";
    public static final String PHONE_NUMBER = "Номер телефона: ";
    public static final String TARIFF = "Наименование тарифа: ";
    public static final String BIRTH_DATE = "Дата рождения: ";
    public static final String PASSPORT = "Номер паспорта: ";
    public static final String EMAIL = "E-mail: ";
    public static final String ADD_EDU = "Дополнительное образование: ";
    public static final String CONTACT_INFO = "Контактная информация: ";
    public static final String ADD_INFO = "Дополнительная информация: ";
    private static final char CHECKED = '\u00FE';
    private static final char UNCHECKED = '\u00A8';

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception {

        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        Font contractFont = new Font(BaseFont.createFont("/contractFont.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED));
        Font tahomaBold = new Font(BaseFont.createFont("/tahomabd.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED));
        Font checkBoxes = new Font(BaseFont.createFont("/wingding.ttf", BaseFont.IDENTITY_H, false), 16f, Font.BOLD);
        contractFont.setSize(14f);

        Contract contract = (Contract) request.getAttribute("contract");
        PhoneNumber number = contract.getNumber();
        Tariff tariff = contract.getTariff();
        Client client = contract.getClient();

        Image image = Image.getInstance(IOUtils.toByteArray(getClass().getResourceAsStream("/t-mobilelogo.jpg")));
        image.setAbsolutePosition(15f, 767f);
        image.scaleAbsolute(60f, 60f);
        image.setUseVariableBorders(true);
        image.setBorder(Rectangle.BOX);
        image.setBorderWidth(10);
        image.setBorderColor(BaseColor.GRAY);
        document.add(image);

        Paragraph header = new Paragraph(new Chunk(CONTRACT_WITH_NUMBER, tahomaBold));
        header.setAlignment(Element.ALIGN_CENTER);
        document.add(header);

        Paragraph contractNumber = new Paragraph(new Chunk("№ " + contract.getId(), contractFont).setUnderline(0.1f, -2f));
        contractNumber.setAlignment(Element.ALIGN_CENTER);
        contractNumber.add(new Chunk(" от " + sdf.format(new Date()) + "г.", contractFont).setUnderline(0.1f, -2f));
        document.add(contractNumber);

        Paragraph clientType = new Paragraph(20f);
        clientType.add(new Chunk(String.valueOf(contract.isActive() ? CHECKED : UNCHECKED), checkBoxes).setCharacterSpacing(5f));
        clientType.add(new Chunk(" Физическое лицо", contractFont));
        clientType.setLeading(50f);
        clientType.add(new Chunk(String.valueOf(!contract.isActive() ? CHECKED : UNCHECKED), checkBoxes).setCharacterSpacing(5f));
        clientType.add(new Chunk(" Юридическое лицо", contractFont));
        document.add(clientType);

        Paragraph lastname = new Paragraph(20f);
        lastname.add(new Chunk("Фамилия: ", tahomaBold));
        lastname.add(new Chunk(client.getLastname(), contractFont));
        document.add(lastname);

        Paragraph firstname = new Paragraph(20f);
        firstname.add(new Chunk("Имя: ", tahomaBold));
        firstname.add(new Chunk(client.getFirstname(), contractFont));
        document.add(firstname);

        Paragraph birthday = new Paragraph(20f);
        birthday.add(new Chunk("Дата рождения: ", tahomaBold));
        birthday.add(new Chunk(sdf.format(client.getBirthday()), contractFont));
        document.add(birthday);

        Paragraph passportHeader = new Paragraph();
        passportHeader.setSpacingBefore(10f);
        passportHeader.add(new Chunk("Паспортные данные: ", tahomaBold));
        passportHeader.setAlignment(Element.ALIGN_CENTER);
        document.add(passportHeader);


        Paragraph passport = new Paragraph();
        passport.setSpacingBefore(10f);
        passport.add(new Chunk("Серия и номер: ", tahomaBold));
        passport.add(new Chunk(client.getPassport(), contractFont));
        document.add(passport);

        Paragraph passportData = new Paragraph();
        passportData.setSpacingBefore(10f);
        passportData.add(new Chunk("Выдан: ", tahomaBold));
        document.add(passportData);

        Paragraph passportAddress = new Paragraph();
        passportAddress.setSpacingBefore(10f);
        passportAddress.add(new Chunk("Дата выдачи: ", tahomaBold));
        document.add(passportAddress);

        Paragraph addressHeader = new Paragraph();
        addressHeader.setSpacingBefore(10f);
        addressHeader.add(new Chunk("Адрес регистрации (прописки)/Адрес доставки счета: ", tahomaBold));
        addressHeader.setAlignment(Element.ALIGN_CENTER);
        document.add(addressHeader);

        Paragraph address = new Paragraph();
        address.setSpacingBefore(10f);
        address.add(new Chunk("Место проживания: ", tahomaBold));
        address.add(new Chunk(client.getAddress(), contractFont));
        document.add(address);


        LineSeparator separator = new LineSeparator();
        separator.setLineWidth(1);
        Chunk linebreak = new Chunk(separator);
        document.add(linebreak);

        checkBoxes.setSize(10f);
        contractFont.setSize(10f);
        Paragraph footer = new Paragraph(20f);
        footer.add(new Chunk("Срок действия Договора: до \"___\" _______ _____г., Если дата договора не указана, то Договор бессрочный.", contractFont));
        footer.add(new Paragraph("На проверку предоставляемых мной сведений в соответствии с подп. 4 п. 3.2 Согласен, если не указанно другое ,", contractFont));
        footer.add(new Chunk(UNCHECKED, checkBoxes));
        footer.add(new Chunk(" не согласен.", contractFont));
        document.add(footer);

        document.close();
        writer.close();
    }
}
