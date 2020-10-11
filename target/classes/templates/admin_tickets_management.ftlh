<#import "parts/common.ftlh" as c>
<#import "parts/navbar.ftlh" as n>
<#import "parts/pager.ftlh" as p>
<#import "/spring.ftl" as spring>

<@c.page>
    <@n.navbar>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/main?lang=${springMacroRequestContext.locale}"><@spring.message "header.home"/></a>
        </li>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/admin_base?lang=${springMacroRequestContext.locale}"><@spring.message "header.home"/></a>
        </li>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/admin_exhibition_management?lang=${springMacroRequestContext.locale}"><@spring.message "admin.exhibitions_managment"/></a>
        </li>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/admin_tickets_management?lang=${springMacroRequestContext.locale}"><@spring.message "admin.tickets_managment"/></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin_tickets_management?lang=uk_UA"><@spring.message "header.switchUk"/></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin_tickets_management?lang=en_US"><@spring.message "header.swithEng"/></a>
        </li>
        <li class="nav-item">
            <@n.logout/>
        </li>
    </@n.navbar>
    <div class="container mt-5">
        <div class="mt-3 mb-3">
            <h2><@spring.message "admin.tickets_managment"/></h2>
        </div>

        <div class="row">
            <div class="col">
                <h5><@spring.message "form.find_tickets"/></h5>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col">
                    <form id="searchTicketByUserId" method="get" action="search_tickets_by_user_id_admin">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.search_by_user_id"/>:
                            </span>
                            </div>
                            <input type="text" name="userId" class="form-control"/>
                            <div class="input-group-append">
                                <button type="submit"
                                        class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <form id="searchByExhibition" method="get" action="search_tickets_by_exhibition_id_admin">

                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.search_by_exhibit_id"/>:
                            </span>
                            </div>
                            <input type="text" name="exhibitionId" class="form-control col-sm-2"/>
                            <div class="input-group-append">
                                <button type="submit"
                                        class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row mt-3 mb-3">
                <form id="searchTicketsByStatus" method="get" action="search_tickets_by_status_admin">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.status"/>:
                            </span>
                            </div>
                            <select size="1" name="ticketStatus" class="custom-select">
                                <option value="TICKET_ACTIVE"><@spring.message "value.active"/></option>
                                <option value="TICKET_WAITING_REFUND"><@spring.message "value.waiting_refund"/></option>
                                <option value="TICKET_REFUNDED"><@spring.message "value.refunded"/></option>
                            </select>
                            <div class="input-group-append">
                                <button type="submit"
                                        class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="row mt-3 mb-3">
                <#if search_ticket_message??>
                    <h4>${search_ticket_message}</h4>
                </#if>
            </div>

            <#if ticketList??>
                <#list ticketList as ticket>
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 class="card-title">
                                <@spring.message "form.ticket_id"/> &nbsp; ${ticket.id}
                                <#if .locale == "en_US">
                                    ${ticket.exhibition.exNameEng}&nbsp;
                                <#else>
                                    ${ticket.exhibition.exNameNative}
                                </#if>
                            </h5>


                            <p class="card-text">
                                <@spring.message "form.opening_hours"/>:&nbsp
                                ${ticket.exhibition.openTime}&nbsp-&nbsp
                                ${ticket.exhibition.closeTime}
                            </p>

                            <#if ticket.exhibition.hallScheduleList??>
                                <#list ticket.exhibition.hallScheduleList as hall>
                                    <h6 class="card-subtitle mb-2 text-muted">
                                        <@spring.message "form.hall"/>:&nbsp${hall.hallName}
                                        <@spring.message "form.start_date"/>:&nbsp${hall.startDateAsString}
                                        &nbsp&nbsp&nbsp
                                        <@spring.message "form.end_date"/>:&nbsp${hall.endDateAsString}
                                    </h6>
                                </#list>
                            </#if>

                            <p class="card-text">
                                ${ticket.customer.email}
                            </p>
                            <p class="card-text">
                                <@spring.message "form.quantity"/>:&nbsp${ticket.quantity}
                            </p>
                            <p class="card-text">
                                <@spring.message "form.ticket_status"/>:&nbsp${ticket.ticketStatus}
                            </p>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>

        <div class="row mt-3 mb-3">
            <div class="col">
                <h5><@spring.message "form.find_user"/></h5>
            </div>
        </div>

        <div class="container">
            <div class="row mt-3 mb-3">
                <div class="col">
                    <form id="searchAllUsers" method="get" action="find_all_users_admin">
                        <button type="submit"
                                class="btn btn-outline-secondary"><@spring.message "button.find_all"/></button>
                    </form>
                </div>
            </div>

            <div class="row mt-3 mb-3">
                <div class="col">
                    <form id="searchUserByEmail" method="get" action="find_user_by_email_admin">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.find_by_email"/>:
                            </span>
                            </div>
                            <input type="text" name="userEmail" class="form-control col-sm-4"/>
                            <div class="input-group-append">
                                <button type="submit"
                                        class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>


            <#if userList??>
                <#list userList as user>
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 class="card-title">
                                ${user.id}</b>
                            </h5>
                            <p class="card-text">
                                ${user.username} &nbsp;&nbsp;&nbsp;
                                ${user.nameNative}&nbsp;&nbsp;&nbsp;
                                ${user.email}
                            </p>
                        </div>
                    </div>
                </#list>
            </#if>

            <div class="row mt-4 mb-4">
                <div class="col">
                    <#if userSearchMessage??>
                        <h4>${userSearchMessage}</h4>
                    </#if>
                </div>
            </div>
        </div>


        <div class="row mt-3 mb-3">
            <div class="col">
                <h5><@spring.message "form.mark_ticket_refunded"/>:</h5>
            </div>
        </div>

        <div class="container">
            <div class="row mt-3 mb-3">
                <div class="col">
                    <form action="/cancel_ticket" method="post">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.ticket_id"/>:
                            </span>
                            </div>
                            <input type="text" name="ticketId" id="ticketId" class="form-control"
                                   required="required">
                            <div class="input-group-append">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit"
                                        class="btn btn-outline-secondary"><@spring.message "button.mark"/></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col">
                </div>
            </div>

            <div class="row mt-3 mb-3">
                <#if cancel_ticket_message??>
                    <h4>${cancel_ticket_message}</h4>
                </#if>
            </div>
        </div>
    </div>
    </div>
</@c.page>