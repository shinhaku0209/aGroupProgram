var city = new Array();
var county = new Array();
var bj = new Array();

city[0] = new Array("10", "Ҷ");
city[1] = new Array("20", "��ʵ");
city[2] = new Array("30", "����");
city[3] = new Array("40", "��Ƥ");


county[0] = new Array("1001", "СҶ");
county[1] = new Array("1002", "Ҷ����С��");

county[2] = new Array("2001", "����V����");

county[3] = new Array("2002", "����V����");

county[4] = new Array("3001", "����");

county[5] = new Array("4001", "����V����");


bj[0] = new Array("100101", "ҶƬ��ƻ�ư�ɫ");
bj[1] = new Array("100102", "����ҶƬ����");
bj[2] = new Array("100201", "��ɫС��");
bj[3] = new Array("100202", "�ƺ�ɫ�ǰ�");
bj[4] = new Array("200101", "���");
bj[5] = new Array("200102", "����ɫˮ��״�߿�");
bj[6] = new Array("200103", "ǳ��ɫ����");
bj[7] = new Array("200104", "ʪ��״С�ߵ�");
bj[8] = new Array("200105", "��T�����ο���");

bj[9] = new Array("200201", "�ƺ�ɫ�߿�");
bj[10] = new Array("200202", "Բ�ΰ��ݲ���");
bj[11] = new Array("200203", "����ɫˮ��״�ߵ�");

bj[12] = new Array("300101", "ˮ��״��ɫ����");
bj[13] = new Array("300102", "���������λ�����Σ�");
bj[14] = new Array("300103", "�������ɫ�����ɫ");
bj[15] = new Array("300104", "Ƥɫ�������޹���Ƥ�㷢��ɫ��ں�ɫ");

bj[16] = new Array("400101", "��Ƥ������");

function innit_area(f_obj) {
    //����һ��Ŀ¼
    f_obj.length = 0;
    f_obj.options[f_obj.length] = new Option("��ѡ��...", "0");
    for (i = 0; i < city.length; i++) {
        f_obj.options[f_obj.length] = new Option(city[i][1], city[i][0]);
    }
}

function change_area(f_obj, s_obj) {
    //���ɶ���Ŀ¼
    s_obj.length = 0;
    s_obj.options[s_obj.length] = new Option("��ѡ��...", "0");
    if (f_obj.value != 0) {
        for (i = 0; i < county.length; i++) {
            if (county[i][0].substring(0, 2) == f_obj.value) {
                s_obj.options[s_obj.length] = new Option(county[i][1], county[i][0]);
            }
        }
    }
}

function change_area3(f_obj, s_obj) {
    //���ɶ���Ŀ¼
    s_obj.length = 0;
    s_obj.options[s_obj.length] = new Option("��ѡ��...", "0");
    if (f_obj.value != 0) {
        for (i = 0; i < bj.length; i++) {
            if (bj[i][0].substring(0, 4) == f_obj.value) {
                s_obj.options[s_obj.length] = new Option(bj[i][1], bj[i][0]);
            }
        }
    }
}
