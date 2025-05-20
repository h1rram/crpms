import { useState } from 'react';

import ServiceRecords from './ServiceRecords';
import CarRegistrationForm from './Cars';
import ServiceManagement from './Service';
import PaymentForm from './Moneny';
import ServiceDashboard from './REport';

const Dashboard = () => {
    const [viewPage, setViewPage] = useState("dash");

    const handleLogout = () => {
        localStorage.removeItem('uname');
        window.location.href="/"
    };

    return (
        <div className="min-h-screen bg-cyan-50">
            <div className="flex">
                <aside className="fixed inset-y-0 left-0 w-64 bg-cyan-800 text-white shadow-lg z-10">
                    <div className="p-6">
                        <h1 className="text-2xl font-bold text-white">CRPMS</h1>
                    </div>
                    <nav className="mt-6">
                        <ul className="space-y-2 px-4">
                            <li>
                                <button
                                    onClick={() => setViewPage("dash")}
                                    className={`w-full flex items-center px-4 py-3 rounded-lg transition-colors ${viewPage === "dash"
                                        ? "bg-cyan-700 text-white"
                                        : "hover:bg-cyan-700 text-cyan-300 hover:text-white"
                                        }`}
                                >
                                    Dashboard
                                </button>
                            </li>
                            <li>
                                <button
                                    onClick={() => setViewPage("car")}
                                    className={`w-full flex items-center px-4 py-3 rounded-lg transition-colors ${viewPage === "car"
                                        ? "bg-cyan-700 text-white"
                                        : "hover:bg-cyan-700 text-cyan-300 hover:text-white"
                                        }`}
                                >
                                    Cars
                                </button>
                            </li>
                            <li>
                                <button
                                    onClick={() => setViewPage("serv")}
                                    className={`w-full flex items-center px-4 py-3 rounded-lg transition-colors ${viewPage === "serv"
                                        ? "bg-cyan-700 text-white"
                                        : "hover:bg-cyan-700 text-cyan-300 hover:text-white"
                                        }`}
                                >
                                    Services
                                </button>
                            </li>
                            <li>
                                <button
                                    onClick={() => setViewPage("reco")}
                                    className={`w-full flex items-center px-4 py-3 rounded-lg transition-colors ${viewPage === "reco"
                                        ? "bg-cyan-700 text-white"
                                        : "hover:bg-cyan-700 text-cyan-300 hover:text-white"
                                        }`}
                                >
                                    Service Records
                                </button>
                            </li>

                            <li>
                                <button
                                    onClick={() => setViewPage("pay")}
                                    className={`w-full flex items-center px-4 py-3 rounded-lg transition-colors ${viewPage === "pay"
                                        ? "bg-cyan-700 text-white"
                                        : "hover:bg-cyan-700 text-cyan-300 hover:text-white"
                                        }`}
                                >
                                    Payments
                                </button>
                            </li>

                          
                        </ul>
                        <div className="absolute bottom-0 left-0 right-0 p-4">
                            <button
                                onClick={handleLogout}
                                className="w-full flex items-center justify-center px-4 py-3 bg-cyan-900 hover:bg-cyan-700 text-white rounded-lg transition-colors"
                            >
                                Logout
                            </button>
                        </div>
                    </nav>
                </aside>

                <main className="ml-64 flex-1 p-0">
                    <header className="flex justify-between items-center mb-1 bg-white p-4">
                        <h1 className="text-2xl font-bold text-cyan-800">
                            {viewPage === "dash" ? "Dashboard" : "Dashboard"}
                        </h1>

                    </header>

                    <div className="bg-white rounded-lg  p-6">
                        {viewPage === "dash" && <ServiceDashboard />}
                        {viewPage === "reco" && <ServiceRecords />}
                        {viewPage === "car" && <CarRegistrationForm />}
                        {viewPage === "serv" && <ServiceManagement/>}
                        {viewPage === "pay" && <PaymentForm/>}

                    </div>
                </main>
            </div>
        </div>
    );
};

export default Dashboard;