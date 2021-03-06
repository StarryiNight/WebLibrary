package com.library.controller;


import com.library.bean.Moment;
import com.library.bean.ReaderCard;
import com.library.bean.Record;
import com.library.service.MomentService;
import com.library.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class RecordController {
    @Autowired
    private RecordService recordService;
    @Autowired
    private MomentService momentService;

    @RequestMapping("/record_add_do.html")
    public String addRecordDo(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        ReaderCard readerCard = (ReaderCard) request.getSession().getAttribute("readercard");
        long reader_id = readerCard.getReaderId();
        long seat_id = Long.parseLong(request.getParameter("seat_id"));
        int moment_id = Integer.parseInt(request.getParameter("moment_id"));
        Moment moment = momentService.getMoment(moment_id);
        Record record = new Record();
        record.setStart_time(moment.getStart_moment());
        record.setEnd_time(moment.getEnd_moment());
        record.setReader_id(reader_id);
        record.setSeat_id(seat_id);

        if (recordService.addRecord(record)) {
            redirectAttributes.addFlashAttribute("succ", "预订成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "预订失败！");
        }
        return "redirect:/myrecord.html";
    }

    @RequestMapping("/updaterecord.html")
    public ModelAndView recordEdit(HttpServletRequest request) {
        long record_id = Long.parseLong(request.getParameter("record_id"));
        Record record = recordService.getRecord(record_id);
        ModelAndView modelAndView = new ModelAndView("admin_record_edit");
        modelAndView.addObject("detail", record);
        return modelAndView;
    }

    @RequestMapping("/record_edit_do.html")
    public String recordEditDo(Record record, RedirectAttributes redirectAttributes) {
        if (recordService.editRecord(record)) {
            redirectAttributes.addFlashAttribute("succ", "记录修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "记录修改失败！");
        }
        return "redirect:/admin_record_list.html";
    }

    @RequestMapping("/deleterecord.html")
    public String deleteRecord(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        long record_id = Long.parseLong(request.getParameter("record_id"));
        if (recordService.deleteRecord(record_id)) {
            redirectAttributes.addFlashAttribute("succ", "记录删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "记录删除失败！");
        }
        return "redirect:/admin_record_list.html";
    }

    @RequestMapping("/admin_record_detail.html")
    public ModelAndView adminRecordDetail(HttpServletRequest request) {
        long record_id = Long.parseLong(request.getParameter("record_id"));
        Record record = recordService.getRecord(record_id);
        ModelAndView modelAndView = new ModelAndView("admin_record_detail");
        modelAndView.addObject("detail", record);
        return modelAndView;
    }

    @RequestMapping("/reader_record_detail.html")
    public ModelAndView readerRecordDetail(HttpServletRequest request) {
        long record_id = Long.parseLong(request.getParameter("record_id"));
        Record record = recordService.getRecord(record_id);
        ModelAndView modelAndView = new ModelAndView("reader_record_detail");
        modelAndView.addObject("detail", record);
        return modelAndView;
    }


    @RequestMapping("/admin_record_list.html")
    public ModelAndView adminRecordList(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin_record_list");
        ArrayList<Record> allRecord = recordService.getAllRecords();
        ArrayList<Record> exceedRecord = recordService.allExceedRecord();
        ArrayList<Record> unSignedRecord =recordService.allUnSignedRecord();
        ArrayList<Record> allUnSignedTime =recordService.allUnSignedTime();
        modelAndView.addObject("allRecord", allRecord);
        modelAndView.addObject("exceedRecord", exceedRecord);
        modelAndView.addObject("unSignedRecord", unSignedRecord);
        modelAndView.addObject("allUnSignedTime", allUnSignedTime);
        return modelAndView;
    }

    @RequestMapping("/myrecord.html")
    public ModelAndView myRecord(HttpServletRequest request) {
        ReaderCard readerCard = (ReaderCard) request.getSession().getAttribute("readercard");
        ModelAndView modelAndView = new ModelAndView("reader_record_list");
        ArrayList<Record> myAllRecord = recordService.myRecordList(readerCard.getReaderId());
        ArrayList<Record> exceedRecord = recordService.exceedRecord(readerCard.getReaderId());
        ArrayList<Record> unSignedRecord =recordService.unSignedRecord(readerCard.getReaderId());
        ArrayList<Record> allUnSignedTime =recordService.allUnSignedTime();
        modelAndView.addObject("allRecord", myAllRecord);
        modelAndView.addObject("exceedRecord", exceedRecord);
        modelAndView.addObject("unSignedRecord", unSignedRecord);
        modelAndView.addObject("allUnSignedTime", allUnSignedTime);
        return modelAndView;
    }

    @RequestMapping("/record_sign_do.html")
    public String recordSignDo(Record record, RedirectAttributes redirectAttributes) {
        if (recordService.signRecord(record)) {
            redirectAttributes.addFlashAttribute("succ", "签到成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "签到失败！");
        }
        return "redirect:/myrecord.html";
    }


}
